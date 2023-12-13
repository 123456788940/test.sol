
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract erc20 is ERC20 {
 



    constructor() ERC20("coin ERC20", "coin") {
     _mint(msg.sender, 100000000000 * 10 * 18);

    }

   

}
