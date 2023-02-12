// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

library stringMethods {
    //convert string to int
    function str2uint(string memory str) public pure returns(uint){
       
        uint len = bytes(str).length;
        uint num = 0;
        bytes memory str1 = bytes(str);
        
        for(uint i = 0; i < len;i ++){ 
            num = num * 10 + (uint8(str1[i]) - 48);     
        }
        
        return num;
    
    }
    //convert int to string
    function uint2str(uint num) public pure returns (string memory) {
        if (num == 0){
            return "0";
        }
        string memory str = "";
        uint num1 = num;
        uint length;
    
        while (num1 != 0){
            length++;
            num1 /= 10;
        }
        
        bytes memory b = new bytes(length);
        
        while (num != 0){
            b[--length] = bytes1(uint8(num % 10 + 48));
            num /= 10;
        }
        str = string(b);
        return str;
    }
    //equivalent string
    function eq(string memory str1, string memory str2) public pure returns(bool){
        return keccak256(abi.encode(str1)) == keccak256(abi.encode(str2));
    }

    //find iterator string example: str = "gdsrhs, i = [1,5,2], return  str2 = "dhs"

    function findIter(string memory str, uint[] memory i) public pure returns(string memory){
    
        bytes memory bStr = bytes(str);       
        uint length = i.length;
        bytes memory str2 = new bytes(length);
       
        for(uint k = 0; k <= i.length-1; k++){  
            uint j = i[k];  
            str2[k] = bStr[j];
        }    
            
        return string(str2);  
    }
    
    //Sum string
    function sum(string memory str1, string memory str2) public pure returns(string memory) {
        
    }
    //split string
    function split(string memory str1, string memory str2) public pure returns(string memory) {
        
    }
}
