pragma solidity ^0.4.18;

contract RedditButton {

address public lastDepositAddress;

uint256 public amount=0;

uint256 public latestBlock=0;

function RedditButton(){

latestBlock=block.number;

lastDepositAddress=msg.sender;

}

function claimTreasure(){

require(block.number-latestBlock>=3);

require(msg.sender == lastDepositAddress);

msg.sender.transfer(amount);

}

function pressButton() payable {

// transfer 1 eth to contract

require(msg.value >= 1000000000000000000);

msg.sender.transfer(msg.value-1000000000000000000);

lastDepositAddress=msg.sender;

amount++;

latestBlock=block.number;

}

}