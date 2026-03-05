// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/CrowdFund.sol";

contract CrowdFundTest is Test {
    CrowdFund public crowdFund;

    address owner = address(1);
    address user1 = address(2);

    function setUp() public {
        crowdFund = new CrowdFund();

        // Give test accounts ETH
        vm.deal(owner, 10 ether);
        vm.deal(user1, 10 ether);
    }

    function testCreateCampaign() public {
        vm.prank(owner);
        crowdFund.create(5 ether, 1 days);

        (
            address campaignOwner,
            uint256 goal,
            ,
            ,
            ,
            
        ) = crowdFund.campaigns(1);

        assertEq(campaignOwner, owner);
        assertEq(goal, 5 ether);
    }

    function testPledge() public {
        vm.prank(owner);
        crowdFund.create(5 ether, 1 days);

        vm.prank(user1);
        crowdFund.pledge{value: 1 ether}(1);

        assertEq(crowdFund.pledgedAmount(1, user1), 1 ether);
    }

    function testClaim() public {
        vm.prank(owner);
        crowdFund.create(1 ether, 1 days);

        vm.prank(user1);
        crowdFund.pledge{value: 1 ether}(1);

        // Move time forward
        vm.warp(block.timestamp + 2 days);

        uint256 balanceBefore = owner.balance;

        vm.prank(owner);
        crowdFund.claim(1);

        assertGt(owner.balance, balanceBefore);
    }

    function testRefund() public {
        vm.prank(owner);
        crowdFund.create(5 ether, 1 days);

        vm.prank(user1);
        crowdFund.pledge{value: 1 ether}(1);

        vm.warp(block.timestamp + 2 days);

        uint256 balanceBefore = user1.balance;

        vm.prank(user1);
        crowdFund.refund(1);

        assertGt(user1.balance, balanceBefore);
    }
}