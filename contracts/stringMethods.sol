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

    //find iterator string example: str = "hello world, i = [2,4,3], return  str2 = "lol"
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
        uint len1 = bytes(str1).length;
        uint len2 = bytes(str2).length;
        bytes memory bStr1 = bytes(str1);
        bytes memory bStr2 = bytes(str2);
        bytes memory sumStr = new bytes(len1+len2);
        uint f = 0;
        for(uint i = 0; i < len1+len2; i++){
            if(i < len1){
                sumStr[i] = bStr1[i];
            }
            if(i >= len1){
                sumStr[i] = bStr2[f];
                f++;   
            }
        }
        return string(sumStr);
    }
    
    //split string str = "XXUXUUUXUXUUXUXX" split to "XU" arr = [ 'X', 'UU', 'U', 'XX' ] Not optimized!!!
    function split(string memory str1, string memory l) public pure returns(string[] memory) {

        //length 
        uint len = bytes(str1).length;
        uint len1 = bytes(l).length;
        //str => bytes
        bytes memory bI = bytes(l);
        bytes memory str = bytes(str1);
        //temp array for split string
        string[] memory arrStr = new string[](len);
        //temp str to add in array
        bytes memory tempStr = new bytes(len);
        //temp number 
        uint flag = 0;
        uint iteralTempStr = 0;
        uint countArr = 0;
        uint lengthToSplit = 0;
        
        for(uint i = 0; i < len; i++){
            uint temp = i;
                
            while(str[temp] == bI[0]){
                
                for(uint j = 0; j < len1; j++){
                      
                    if(bI[j] != str[temp]){ 
                        flag = 1;
                        break;
                    }else{
                        flag = 0;
                    }
                    if(temp >= len-1){

                        if(j == len1-1){
                            flag = 0;
                        }else{ 
                            flag = 1;
                        }
                        break;
                    }
                    temp++;
                }
                if(flag == 1){
                    break;     
                }else{
                    lengthToSplit++;
                }

                if(iteralTempStr > 0 ){
                    bytes memory t = new bytes(iteralTempStr);
                              
                    for(uint k = 0; k < iteralTempStr; k++){
                        t[k] = tempStr[k];
                        tempStr[k] = 0x00;
                    }
                    arrStr[countArr] = string(t);
                    countArr++;
                }
                
                iteralTempStr = 0;
                flag = 0;  
                i = i + len1*lengthToSplit;   
                lengthToSplit = 0;
                
                if(i > len-1){
                    string[] memory splitString = new string[](countArr);
                    for(uint p = 0; p < countArr; p++){
                        splitString[p] = arrStr[p];
                    }
                    return splitString;
                }
            }
            tempStr[iteralTempStr] = str[i];
            iteralTempStr++;
            if(len-1 <= i){  
                bytes memory t = new bytes(iteralTempStr);
                for(uint k = 0; k < iteralTempStr; k++){
                    t[k] = tempStr[k];
                    tempStr[k] = 0x00;
                }
                arrStr[countArr] = string(t);
                if(countArr == 0){
                     return arrStr;
                }
                string[] memory splitString = new string[](countArr+1);
                for(uint p = 0; p < countArr+1; p++){
                    splitString[p] = arrStr[p];

                }
                return splitString; 
            }
            
        }
        
    }
    
    
    //sort string
}
