pragma solidity ^0.4.24;

interface AlarmWakeUp {
    function callback(bytes _data) external;
}

contract AlarmService {
    
    struct TimeEvent {
        address addr;
        bytes data;
    }
    TimeEvent _timeEvent;
    TimeEvent[] timeEvents;
    
    mapping(uint => TimeEvent[]) private _events;
    
    function set(uint _time) 
        public 
        returns (bool) {
        _timeEvent.addr = msg.sender;
        _timeEvent.data = msg.data;
        _events[_time].push(_timeEvent);
    }
    
    function call(uint _time) 
        public {
        timeEvents = _events[_time];
        for(uint i = 0; i < timeEvents.length; i++) {
            AlarmWakeUp(timeEvents[i].addr).callback(timeEvents[i].data);
        }
    }
}

contract Alarm is AlarmWakeUp {
    
    AlarmService private _alarmService;
    
    function AlarmTrigger() public {
        _alarmService = new AlarmService();
    }
    
    function callback(bytes _data) external {
        _data; // Do something with data
    }
    
    function setAlarm() 
        public {
        _alarmService.set(block.timestamp+60);
    }
    
}