// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Trust{
    struct Kid {
        uint amount;
        uint maturity;
        bool paid;
    }
    mapping(address => Kid) public kids;
    address public admin;
    
    constructor(){
        admin = msg.sender;
    }
    
    function addKid(address kid ,uint timetoMaturity) external payable{
        require(msg.sender == admin , 'Only admin');
        require(kids[msg.sender].amount == 0 ,'kid already exist');
        kids[kid] = Kid(msg.value,block.timestamp + timetoMaturity ,false);
    }

    function withDraw() external {
        Kid storage kid = kids[msg.sender];
        require(kid.maturity <= block.timestamp,'TOO EARLY');
        require(kid.amount > 0,'only kid can withDraw');
        require(kid.paid == false ,'Paid already');
        kid.paid = true;
        payable(msg.sender).transfer(kid.amount);
    }
}