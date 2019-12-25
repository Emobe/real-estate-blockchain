pragma solidity ^0.5.0;

import '@openzeppelin/upgrades/contracts/Initializable.sol';
import '@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721Full.sol';
import '@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721Mintable.sol';
import "@openzeppelin/contracts-ethereum-package/contracts/access/Roles.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/drafts/Counters.sol";

contract Deed is Initializable, ERC721Full, ERC721Mintable {
  using Roles for Roles.Role;
  using Counters for Counters.Counter;

  Roles.Role private _estateAgents;
  Counters.Counter private _deedIds;
  address public _vault = 0x22d491Bde2303f2f43325b2108D26f1eAbA1e32b;

  function initialize(address[] memory estateAgents, address vault) public initializer {
    ERC721.initialize();
    ERC721Enumerable.initialize();
    ERC721Metadata.initialize("Deed", "DEED");
    ERC721Mintable.initialize(msg.sender);
    //_vault = vault;
    for(uint256 i = 0; i < estateAgents.length; ++i){
      _estateAgents.add(estateAgents[i]);
    }
  }

  function create(string memory deedUri) public returns (uint256) {
    //require(_estateAgents.has(msg.sender), "DOES_NOT_HAVE_ESTATE_AGENT_ROLE");
    _deedIds.increment();
    uint256 newDeedId = _deedIds.current();
    _mint(_vault, newDeedId);
    _setTokenURI(newDeedId, deedUri);
    return newDeedId;
  }

  function transferDeed(address from, address to, uint256 tokenId) public{
    require(_estateAgents.has(msg.sender), "DOES_NOT_HAVE_ESTATE_AGENT_ROLE");
    transferFrom(from, to, tokenId);
  }

  function giveDeed(address from, uint256 deedId) public {
    transferFrom(from, _vault, deedId);
  }

  function vaultBalance() public view returns (uint256) {
    return balanceOf(_vault);
  }

  function getBalanceOf(address agent) public view returns (uint256){
    return 1;
    //return balanceOf(agent);
  }

}