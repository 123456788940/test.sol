
    function buyProduct() public {
        require(Product[msg.sender].added, "not sold");
            require(Product[msg.sender].quantity > 0, "has to be more than 100");
            Product[msg.sender].quantity--;
               
            
  
         token.transferFrom(msg.sender, address(this), 100);
    


    }

}
