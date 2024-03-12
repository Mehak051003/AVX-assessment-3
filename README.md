# Creating our own ERC20 Token

This Solidity program implements an ERC20 token with the symbol. It includes functionalities for minting, transferring, and burning tokens. Below is the detailed description and instructions for using this contract.

## Description

This contract defines an ERC20 token with the symbol. It allows for the minting of new tokens by the contract owner, transferring tokens between addresses, and burning tokens. The contract provides basic functionalities required by the ERC20 token standard.

## Getting Started

### Executing program

To deploy and interact with this contract, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to the Remix website at https://remix.ethereum.org/.

2.Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., token.sol).

3.Copy and paste the provided Solidity code into the file.

4.Compile the code by clicking on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile token.sol" button.

6.Deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Token" contract from the dropdown menu, and then click on the "Deploy" button.
Once the contract is deployed, you can interact with it by calling its functions.

## Interacting with the contract
After deploying the contract, you can interact with it using the following functions:

Minting tokens: Only the owner of the contract can mint new tokens. Call the mint function with the recipient's address and the amount of tokens to mint.

Transferring tokens: Call the transfer function with the recipient's address and the amount of tokens to transfer.

Burn tokens: Call the burn function with the sender's address and the amount of tokens to approve.

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    address owner;
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
        // Mint initial supply to the contract owner
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    modifier checkAmount(uint amount) {
        require(amount > 0, "Transfer amount must be greater than 0");
        _;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    function mint(address to, uint amount) external onlyOwner {
        // Allowing only the owner to mint new tokens
        _mint(to, amount);
    }

    function burn(uint amount) external checkAmount(amount) {
        // Allowing any user to burn their own tokens
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint amount) public checkAmount(amount) override returns (bool) {
        // Overriding transfer function
        return super.transfer(to, amount);
    }
}
```

![image](https://github.com/Mehak051003/AVX-assessment-3/assets/118992603/37f2e4e4-d663-47f1-8692-c77e03f9b887)


## Authors

Mehak Thakur 
[mehakthakur051003@gmail.com]

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
