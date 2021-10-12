// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract MyNFT is ERC721Enumerable, Ownable {

    using Strings for uint256;

    string _baseTokenURI;
    uint256 private _price = 0.0001 ether;
    bool public _paused = false;

    // withdraw addresses
    address t1 = 0x000000000000000000000000000000000000dEaD;
    address t2 = 0x000000000000000000000000000000000000dEaD;

    constructor(string memory baseURI) ERC721("MyNFT", "MYNFT")  {
        setBaseURI(baseURI);

        // // team gets the first NFTs
        _safeMint( t1, 1);
        _safeMint( t2, 2);
    }

    modifier onlyWithdrawAddresses {
        require(msg.sender == t1 || msg.sender == t2);
        _;
    }

    function awardItem(uint256 num) public payable {
        uint256 supply = totalSupply();
        require( !_paused,                    "Sale paused" );
        require( num < 11,                    "You can mint a maximum of 10 NFTs at once");
        require( supply + num < 4,            "Exceeds maximum NFT supply" );
        require( msg.value >= _price * num,   "Ether sent is not correct" );

        for(uint256 i = 1; i <= num; i++) {
            _safeMint( msg.sender, supply + i );
        }
    }

    function walletOfOwner(address _owner) public view returns(uint256[] memory) {
        uint256 tokenCount = balanceOf(_owner);

        uint256[] memory tokensId = new uint256[](tokenCount);
        for(uint256 i; i < tokenCount; i++){
            tokensId[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return tokensId;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function setBaseURI(string memory baseURI) public onlyOwner {
        _baseTokenURI = baseURI;
    }

    function pause(bool val) public onlyWithdrawAddresses {
        _paused = val;
    }

    function withdrawAll() public payable onlyWithdrawAddresses {
        uint256 _each = address(this).balance / 2;
        require(payable(t1).send(_each));
        require(payable(t2).send(_each));
    }
}
