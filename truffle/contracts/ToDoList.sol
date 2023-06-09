// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ToDoList {
    string public title;
    address public owner;
    struct Task {
        bool done;
        string description;
    }
    Task[] public tasksList;

    constructor(string memory _title) {
        title = _title;
        owner = msg.sender;
    }

    function createTask(string memory _description) public onlyOwner {
        Task memory newTask = Task({done: false, description: _description});
        tasksList.push(newTask);
    }

    function completeTask(uint taskIndex) public onlyOwner {
        require(taskIndex < tasksList.length, "Task index out of bounds");
        tasksList[taskIndex].done = true;
    }

    function getTasksListLength() public view returns (uint) {
        return tasksList.length;
    }

    function getTasksList() public view returns (Task[] memory) {
        return tasksList;
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the contract owner can call this function."
        );
        _;
    }
}
