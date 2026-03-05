// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    address public userA = address(0xA11CE);
    address public userB = address(0xB0B);

    function setUp() public {
        counter = new Counter();
    }

    function test_Increment() public {
        vm.prank(userA);
        counter.increment();
        assertEq(counter.counters(userA), 1);
    }

    function test_Reset() public {
        vm.startPrank(userA);
        counter.increment();
        counter.increment();
        counter.reset(userA);
        vm.stopPrank();

        assertEq(counter.counters(userA), 0);
    }

    function test_CannotResetAnotherUsersCounter() public {
        vm.prank(userA);
        counter.increment();

        vm.prank(userB);
        vm.expectRevert("cannot reset another user's counter");
        counter.reset(userA);

        assertEq(counter.counters(userA), 1);
    }
}
