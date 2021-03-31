pragma solidity ^0.8.0;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNft is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(string => uint8) hashes;

    // https://forum.openzeppelin.com/t/function-settokenuri-in-erc721-is-gone-with-pragma-0-8-0/5978/5

    constructor() ERC721("MyNft", "MNFT") {}

    function awardItem(
        address recipient,
        string memory hash,
        string memory metadata
    ) public returns (uint256) {
        require(hashes[hash] != 1);
        hashes[hash] = 1;
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, metadata);
        return newItemId;
    }
}

/*
 JWT: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySW5mb3JtYXRpb24iOnsiaWQiOiJjM2Y4YjYxOS0zZjI3LTRkZGYtYjFlNi0xMzJhY2NlMzMzZDciLCJlbWFpbCI6ImFsbG1lbm11c3RjcnlwdG9AcHJvdG9ubWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwicGluX3BvbGljeSI6eyJyZWdpb25zIjpbeyJpZCI6Ik5ZQzEiLCJkZXNpcmVkUmVwbGljYXRpb25Db3VudCI6MX1dLCJ2ZXJzaW9uIjoxfSwibWZhX2VuYWJsZWQiOmZhbHNlfSwiYXV0aGVudGljYXRpb25UeXBlIjoic2NvcGVkS2V5Iiwic2NvcGVkS2V5S2V5IjoiZWY3ODRjNDViZmQwMjI5MTgzNWYiLCJzY29wZWRLZXlTZWNyZXQiOiJhZDc1YTc2OGMzYzdmMGE2ZDZkOTNlMDUwM2VmZDdmNTY3MzM4MTg3ZmM5YmQ5YmNhY2QwYjlkMTZlZTZkNjhkIiwiaWF0IjoxNjE3MTc5ODg4fQ.hpozL9xzsn0aIL0g3ciCUJ7oNCdo7VlmFOzTS7Ap1eM
 */
