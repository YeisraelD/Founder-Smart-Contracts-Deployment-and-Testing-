// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {CrowdFund} from "../src/CrowdFund.sol";

contract CounterScript is Script {
    CrowdFund public crowdFund;

    function run() public {
        vm.startBroadcast();

        crowdFund = new CrowdFund();

        vm.stopBroadcast();
    }
}