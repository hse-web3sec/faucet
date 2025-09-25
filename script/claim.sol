// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";

import {Faucet} from "../src/Faucet.sol";

// forge script ClamEthScript --rpc-url hoodi --private-key $KEY --broadcast
contract ClamEthScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        address faucet = 0x1BE5e8494D9a34c450a0fe91c87DD6184d67D34A;

        console.log("faucet balance:", faucet.balance);

        Faucet(payable(faucet)).claim(address(0x00));

        console.log("faucet balance:", faucet.balance);

        vm.stopBroadcast();
    }
}
