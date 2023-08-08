// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyToken {
    string public token_name;
    string public token_symbol;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        token_name = "My Custom Token";
        token_symbol = "MCT";
        totalSupply = 1000;
        owner = msg.sender;
    }

    function mint(address user, uint256 amount) public onlyOwner {
        totalSupply += amount;
        balanceOf[user] += amount;
    }

    function burn(uint256 amount) public {
        if (balanceOf[msg.sender] >= amount) {
            totalSupply -= amount;
            balanceOf[msg.sender] -= amount;
        }
    }

    function transfer(address to, uint256 amount) public {
        require(to != address(0), "ERC20: transfer to the zero address");
        require(balanceOf[msg.sender] >= amount, "ERC20: transfer amount exceeds balance");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }

    
}