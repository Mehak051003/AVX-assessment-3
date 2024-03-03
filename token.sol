// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract Token is ERC20
{
    address public owner;
    constructor(string memory name,string memory symbol) ERC20(name,symbol)
    {
        owner=msg.sender;
    }

    modifier onlyOwner
    {
        require(msg.sender==owner,"Only owner can do this");
        _;
    }

    function mint(address _to,uint amount) public onlyOwner 
    {
        _mint(_to,amount);
    }

}
