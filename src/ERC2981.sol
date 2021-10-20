// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/interfaces/IERC2981.sol';

abstract contract ERC2981 is IERC2981 {
  address public royaltyReceiver;
  uint256 public royaltyPercentage;

  constructor(address _royaltyReceiver, uint256 _royaltyPercentage) {
    royaltyReceiver = _royaltyReceiver;
    royaltyPercentage = _royaltyPercentage;
  }

  function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    returns (bool)
  {
    return
      interfaceId == type(IERC165).interfaceId ||
      interfaceId == type(IERC2981).interfaceId;
  }

  function royaltyInfo(uint256, uint256 salePrice)
    external
    view
    virtual
    returns (address, uint256)
  {
    return (royaltyReceiver, (salePrice * royaltyPercentage) / 100);
  }
}
