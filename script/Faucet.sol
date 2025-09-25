// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";

import {Faucet} from "../src/Faucet.sol";

// forge script FaucetScript
// forge script FaucetScript --rpc-url hoodi --private-key $KEY --broadcast

contract FaucetScript is Script {
    Faucet public faucet;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        // deploy
        faucet = new Faucet{value: 50 ether}();

        console.log("faucet:", address(faucet));
        console.log("faucet balance:", address(faucet).balance);

        faucet.claim(0x7646e7e5E871d0d33624321c3893A89Ca07f4f02);

        console.log("faucet balance:", address(faucet).balance);

        vm.stopBroadcast();
    }
}
