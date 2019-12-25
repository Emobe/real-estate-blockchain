pragma solidity ^0.5;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Deed.sol";

contract DeedTest {
    function testDeed() {
        Deed deed = Deed(DeployedAddresses.Deed());
        Assert.equal(1, 1, '123');
    }

}