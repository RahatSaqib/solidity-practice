// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.5 < 0.9;

contract Idnetity
{
    string name;
    uint age;
    
    constructor()
    {
        name = "Rahat";
        age = 25;
    }
    function getName() view public returns(string memory)
    {
            return name;
    }    
    function getAge() view public returns(uint)
    {
            return age;
    }
    function setAge() public
    {
        age = age +1;
    }
}