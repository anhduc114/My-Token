pragma solidity ^0.8.0;

contract MyToken {
    // Define the token's name
    string public name = "LTalk";

    // Define the token's symbol
    string public symbol = "LTK";

    // Define the token's decimal places
    uint8 public decimals = 18;

    // Define the token's total supply
    uint256 public totalSupply;

    // Mapping from account addresses to their token balances
    mapping(address => uint256) public balanceOf;

    // Event to be fired when the token is transferred
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Initialize the total supply and assign all tokens to the contract creator
    constructor(uint256 initialSupply) public {
        totalSupply = initialSupply;
        balanceOf[msg.sender] = totalSupply;
    }

    // Transfer function to allow transfers of tokens between accounts
    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    //fix 4

}