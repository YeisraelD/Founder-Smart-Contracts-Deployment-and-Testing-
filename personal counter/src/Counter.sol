// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    mapping(address => uint256) public counters;

    function increment() public {
        counters[msg.sender]++;
    }

    function reset(address user) public {
        require(user == msg.sender, "cannot reset another user's counter");
        counters[user] = 0;
    }
    
}
