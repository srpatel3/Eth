pragma solidity ^0.4.8;
contract A {
    
    address owner; //for modifier 
    function A(){
        owner = msg.sender;
    }
}

