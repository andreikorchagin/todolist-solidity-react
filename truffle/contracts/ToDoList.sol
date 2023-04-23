// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ToDoList {
    string public title;
    address public owner;
    struct Task {
        bool done;
        string description;
    }
    Task[] public tasksList;

    constructor(string memory listTitle) {
        title = listTitle;
        owner = msg.sender;
    }
}
