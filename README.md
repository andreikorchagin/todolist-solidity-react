# ToDoList Smart Contract

This is a smart contract implemented in Solidity that allows managing TODO tasks.

## Getting Started

To get started with this smart contract, follow these steps:

1. Clone this repository
2. Deploy the smart contract to the Ethereum blockchain
3. Interact with the smart contract using a web3 provider (such as Metamask) or using a script that interacts with the contract's functions

## Prerequisites

To compile and deploy this smart contract, you need to have the following software installed:

- Solidity compiler (version 0.8.0 or later)
- Ethereum client (such as Geth, Parity, or Ganache)
- Web3 provider (such as Metamask for interacting with the smart contract in a Dapp)

## Usage

The smart contract has the following functions:

- `constructor`: Initializes the smart contract with a title and sets the owner as the deployer account.

- `createTask`: Allows creating a new task by passing a description.

- `completeTask`: Allows marking a task as completed by passing the task index.

### Deploying the smart contract

To deploy the smart contract, follow these steps:

1. Compile the smart contract by running `solc ToDoList.sol` in the terminal.
2. Deploy the smart contract to an Ethereum network (such as Ropsten or Rinkeby).
3. Copy the contract address and ABI to interact with the smart contract.

### Interacting with the smart contract

You can interact with the smart contract using a web3 provider or using a script that interacts with the contract's functions.

To interact with the smart contract using a web3 provider, follow these steps:

1. Install Metamask in your browser
2. Connect to the Ethereum network (such as Ropsten or Rinkeby) in Metamask
3. Copy the contract address and ABI to interact with the smart contract in Metamask.

To interact with the smart contract using a script, follow these steps:

1. Install Web3.js using `npm install web3`
2. Initialize Web3.js with the Ethereum client URL
```
const Web3 = require("web3");
const url = "{INSERT_ETHEREUM_CLIENT_URL_HERE}"
const web3 = new Web3(url);
```
3. Copy the contract ABI and address
```
const abi = [{INSERT_ABI_HERE}]
const address = "{INSERT_CONTRACT_ADDRESS_HERE}"
```
4. Initialize the contract object
```
const contract = new web3.eth.Contract(abi, address);
```
5. Interact with the smart contract functions
```
// Example: call the createTask function
contract.methods.createTask("Buy milk").send({from: "{INSERT_SENDER_ACCOUNT_ADDRESS_HERE}"});
```