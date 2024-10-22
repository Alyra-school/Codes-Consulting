// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Exemple {
    string test;

    constructor() {
        test = "salut";
    }

    function getText() external view returns (string memory){
        return test;
    }

    function setText(string calldata _text) external {
        test = _text;
    }
}
