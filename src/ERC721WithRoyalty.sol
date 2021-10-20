// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/interfaces/IERC2981.sol';
import './ERC2981.sol';

contract ERC721WithRoyalty is ERC721, ERC2981 {
  constructor(
    string memory _name,
    string memory _symbol,
    address _royaltyReceiver,
    uint256 _royaltyPercentage
  ) ERC721(_name, _symbol) ERC2981(_royaltyReceiver, _royaltyPercentage) {
    royaltyReceiver = _royaltyReceiver;
    royaltyPercentage = _royaltyPercentage;
  }

  function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721, ERC2981)
    returns (bool)
  {
    return
      ERC721.supportsInterface(interfaceId) ||
      ERC2981.supportsInterface(interfaceId);
  }
}
