
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./erc20.sol";

contract productStore {
    erc20 public token;
   

    struct product {
        string _type;
        uint quantity;
        bool added;
    }

    mapping(address => product) public Product;

    constructor(address _tokenAddress) {
     token = erc20(_tokenAddress);
     
    }

    function addProduct(string memory _type, uint quantity) public {
        require(!Product[msg.sender].added, "not sold");

        Product[msg.sender] = product ({
            _type: _type,
            quantity: quantity,
            added: true

        });

    }


    function buyProduct() public {
        require(Product[msg.sender].added, "not sold");
            require(Product[msg.sender].quantity > 0, "has to be more than 100");
            Product[msg.sender].quantity--;
               
            
  
         token.transferFrom(msg.sender, address(this), 100);
    


    }

}
