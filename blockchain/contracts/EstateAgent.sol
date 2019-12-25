pragma solidity ^0.5.0;

import '@openzeppelin/upgrades/contracts/Initializable.sol';
import "./Deed.sol";

contract EstateAgent is Initializable {
    Deed public deed = new Deed();
    function initialize() public {

    }

    function transferDeed(address from, address to, uint256 tokenId) public{
        //require(_estateAgents.has(msg.sender), "DOES_NOT_HAVE_ESTATE_AGENT_ROLE");
        //transferFrom(from, to, tokenId);
    }

    function giveDeed(address from, uint256 deedId) public {
        //transferFrom(from, _vault, deedId);
    }

    function vaultBalance() public view returns (uint256) {
        return deed.getBalanceOf(address(this));
    }

    function getDeed() public view {

    }
}