// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "../contracts/ToDoList.sol";

contract TestToDoList {
    function testCreateTask() public {
        ToDoList toDoList = new ToDoList("My To-Do List");

        string memory expectedTaskDescription = "My Task";
        uint expectedTaskCount = 1;

        toDoList.createTask(expectedTaskDescription);

        uint actualTaskCount = toDoList.tasksList.length;
        string memory actualTaskDescription = toDoList.tasksList[0].description;

        Assert.equal(
            actualTaskCount,
            expectedTaskCount,
            "Task count should increment by 1"
        );
        Assert.equal(
            actualTaskDescription,
            expectedTaskDescription,
            "Task description should be equal to the expected value"
        );
    }

    function testCompleteTask() public {
        ToDoList toDoList = new ToDoList("My To-Do List");

        toDoList.createTask("My Task");

        uint expectedTaskIndex = 0;
        bool expectedTaskStatus = true;

        toDoList.completeTask(expectedTaskIndex);

        bool actualTaskStatus = toDoList.tasksList[expectedTaskIndex].done;

        Assert.equal(
            actualTaskStatus,
            expectedTaskStatus,
            "Task status should be true after completion"
        );
    }
}
