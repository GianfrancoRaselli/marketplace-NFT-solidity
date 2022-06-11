// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.5.0/utils/Counters.sol";


contract NFT is ERC721URIStorage {
  
  using Counters for Counters.Counter;
  Counters.Counter private _tokensCount;

  constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) { }

  function mint(string memory _tokenURI) external returns (uint) {
    uint tokensCount = _tokensCount.current();
    _tokensCount.increment();

    _safeMint(msg.sender, tokensCount);
    _setTokenURI(tokensCount, _tokenURI);

    return tokensCount;
  }
  
}
