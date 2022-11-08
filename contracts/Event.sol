// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;


struct Event {
    address organizer;
    string name;
    uint date;
    uint price;
    uint ticketCount;
    uint ticketRemaining;

}

   contract  EventContract{

    mapping (uint=>Event) public events; 

    mapping (address =>mapping(uint=>uint)) public tickets;

    uint public nextId;

    function createEvent(string memory _name,uint _date,uint _price,uint _ticketCount) external{
        require (_date>block.timestamp,"u can only create envet for future ");
        require (_ticketCount>0, "there shoud be som tickets for sell");

       events[nextId] = Event(msg.sender,_name,_date,_price,_ticketCount,_ticketCount);
       nextId++;
    }
    

    function buyTicket(uint id , uint quantity) external payable {
        require (events[id].date>0 ,"ther is not any event ");
        require (events[id].date>block.timestamp,"event is over ");
        Event storage _evnet = events[id];
        require (_evnet.ticketCount >=quantity,"ticket is not left ");
        require (msg.value ==(_evnet.price*quantity),"ether  is not enough ");

       _evnet.ticketRemaining -quantity;

       tickets[msg.sender][id] += quantity;

    }
    function transferTicket(uint id,uint quantity,address to) external {
         require (events[id].date>0 ,"ther is not any event ");
        require (events[id].date<block.timestamp,"event is over ");
        require (tickets[msg.sender][id] >= quantity,"u dont have engouh tickets");
       tickets[msg.sender][id] -= quantity;
       tickets[to][id] += quantity;



     }
    
         }