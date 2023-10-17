# DegenToken Smart Contract

The DegenToken smart contract is an Ethereum-based token contract that adheres to the ERC-20 standard. It introduces additional features such as the ability to mint new tokens, burn existing tokens, purchase and use power-ups, check balances, and transfer tokens between addresses.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This smart contract provides a versatile token with various functionalities to cater to a range of use cases. It is designed to be used as a foundation for creating tokens and managing in-game assets, power-ups, or other digital assets.

## Features

### 1. Minting
- The contract owner has the ability to mint new tokens and distribute them to specific addresses. This can be used to increase the total supply of the token.

### 2. Burning
- Token holders can burn (destroy) their own tokens, reducing their own balance. This helps manage the token supply.

### 3. Power-Ups
- The contract introduces a unique feature known as "Power-Ups." Users can purchase these power-ups by spending Degen tokens. Each power-up has a name, price, and duration. Purchasing a power-up is considered "redeeming" as it involves spending tokens for in-game benefits.

### 4. Balance Checks
- The contract includes checks to ensure that users have a sufficient balance before performing actions like transferring tokens or purchasing power-ups.

### 5. Token Transfers
- Users can transfer Degen tokens to other Ethereum addresses using the "transferTokens" function, provided they have a balance exceeding the specified amount.

## Getting Started

To deploy and interact with the DegenToken smart contract, you need to be familiar with Ethereum development and the Solidity programming language. You can deploy the contract on a development or mainnet Ethereum network.

## Usage

1. Deploy the contract on an Ethereum network.
2. Mint tokens if you are the contract owner.
3. Use the "transferTokens" function to transfer tokens to other addresses.
4. Burn tokens if needed to reduce the token supply.
5. Create and add custom power-ups using the "addCustomPowerUp" function.
6. Users can purchase power-ups using the "purchasePowerUp" function.
7. Check user power-ups and remaining durations for active power-ups using the respective functions.

## Contributing

If you'd like to contribute to the development of this project, please follow our [contribution guidelines](CONTRIBUTING.md).

## License

This smart contract is released under the MIT License. See [LICENSE](LICENSE) for more details.
