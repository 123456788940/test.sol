
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";



contract NFTBill is ERC721 {
    address public owner;
    modifier onlyOwner(){
       require(msg.sender == owner, "not the owner");
        _;
    }
    uint private billCounter;
   event mintBills(address to);

    constructor() ERC721("NFTBill", "NFT") {
        billCounter = 1;
        owner = msg.sender;
    }

    mapping(address => uint[]) public userBills;

   function _mintBills(address to) public onlyOwner{
     uint newTokenId = billCounter;
     _mint(to, newTokenId);
     userBills[to].push(newTokenId);
     billCounter++;

emit mintBills(to);
    }

   
    function getUserBills(address user) external view returns(uint[] memory) {
        return userBills[user];
    }


 }
