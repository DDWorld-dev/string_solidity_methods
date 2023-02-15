// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./stringMethods.sol";

contract test{
    using stringMethods for string;
    using stringMethods for uint;

    function str2uint(uint a) public pure returns(string memory){
        return a.uint2str();
    }
    function uint2str( string memory str) public pure returns(uint){
      
        return str.str2uint();
    }

    function Iterat(string memory str, uint[] memory i) public pure returns(string memory){
        return str.findIter(i);
    }
    function eq(string memory str1, string memory str2) public pure returns(bool) {
        return str1.eq(str2);
    }
    function sum(string memory str1, string memory str2) public pure returns(string memory){
        return str1.sum(str2);
    }
    function split(string memory str, string memory s) public pure returns(string[] memory){
        return str.split(s);
    }

}