// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ToDoList.sol";

contract TestToDoList {
    ToDoList toDoList = ToDoList(DeployedAddresses.ToDoList());
    string taskDescription = "Complete unit testing for ToDoList contract.";

    function testInitialTasksListLength() public {
        uint expected = 0;
        Assert.equal(
            toDoList.getTasksListLength(),
            expected,
            "Tasks list should be empty."
        );
    }

    function testCreateTask() public {
        address contractAddress = address(toDoList);
        address ownerAddress = contractAddress.owner();
        toDoList.createTask("Test Task", 0, {from: ownerAddress});
        uint count = toDoList.getTasksCount();
        Assert.equal(count, 1, "Task count should be 1 after creating a new task.");
        string memory taskDescription = toDoList.getTasksList()[0].description;
        Assert.equal(taskDescription, "Test Task", "Description of newly created task should be 'Test Task'.");
    }

    function testCompleteTask() public {
        address contractAddress = address(toDoList);
        address ownerAddress = contractAddress.owner();
        toDoList.completeTask(0, {from: ownerAddress});
        Assert.isTrue(
            toDoList.getTasksList()[0].done,
            "Newly created task should not be marked as done."
        );
    }
}