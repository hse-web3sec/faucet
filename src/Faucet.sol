// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Faucet {
    address owner;
    mapping(address => bool) isFunded;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    event Claimed(address receiver);

    constructor() payable {
        owner = msg.sender;
    }

    function claim(address receiver) external {
        require(!isFunded[receiver] && !isFunded[msg.sender]);
        isFunded[receiver] = true;
        isFunded[msg.sender] = true;
        payable(receiver).transfer(1 ether);
        emit Claimed(receiver);
    }

    function rugpull() external onlyOwner {
        payable(msg.sender).transfer(1 ether);
    }

    receive() external payable {}
}
