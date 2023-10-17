// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    struct PowerUp {
        string name;
        uint256 price;
        uint256 duration; // Duration of the power-up in seconds
    }

    PowerUp[] public powerUps;

    mapping(address => PowerUp[]) public userPowerUps;

    constructor(uint256 initialSupply) ERC20("Degen", "DGN") {
        _mint(msg.sender, initialSupply);
    }

    function createPowerUp(string memory _name, uint256 _price, uint256 _duration) internal onlyOwner {
        powerUps.push(PowerUp(_name, _price, _duration));
    }

    function addCustomPowerUp(string memory _name, uint256 _price, uint256 _duration) public onlyOwner {
        createPowerUp(_name, _price, _duration);
    }

    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    function transferTokens(address _to, uint256 _amount) external {
        require(_to != address(0), "Invalid address");
        require(balanceOf(msg.sender) >= _amount, "Insufficient balance");
        _transfer(msg.sender, _to, _amount);
    }

    function burnTokens(uint256 _amount) external { 
        require(balanceOf(msg.sender) >= _amount, "Insufficient balance");
        _burn(msg.sender, _amount);
    }

    function purchasePowerUp(uint256 _powerUpIndex) external payable {
        require(_powerUpIndex < powerUps.length, "Invalid power-up index");
        PowerUp storage powerUp = powerUps[_powerUpIndex];
        require(balanceOf(msg.sender) >= powerUp.price, "Insufficient balance");

        // Add the power-up to the user's collection
        userPowerUps[msg.sender].push(powerUp);

        // Deduct the price of the power-up from the player's balance
        _burn(msg.sender, powerUp.price);
    }

    function getUserPowerUps(address _user) external view returns (PowerUp[] memory) {
        return userPowerUps[_user];
    }

    function getRemainingDuration(address _user, uint256 _powerUpIndex) external view returns (uint256) {
        require(_powerUpIndex < userPowerUps[_user].length, "Invalid power-up index");
        PowerUp storage powerUp = userPowerUps[_user][_powerUpIndex];
        // Calculate remaining duration based on block timestamp
        uint256 elapsedTime = block.timestamp - (powerUp.duration);
        if (elapsedTime >= powerUp.duration) {
            return 0;
        }
        return powerUp.duration - elapsedTime;
    }
}