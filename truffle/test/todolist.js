const ToDoList = artifacts.require("ToDoList");

contract("ToDoList", () => {
  let toDoList;
  const taskDescription = "Complete unit testing for ToDoList contract.";

  before(async () => {
    toDoList = await ToDoList.deployed();
  });

  it("should test initial tasks list length", async () => {
    const expected = 0;
    const listLength = await toDoList.getTasksListLength.call();
    assert.equal(listLength, expected, "Tasks list should be empty.");
  });

  it("should test creating a new task", async () => {
    await toDoList.createTask(taskDescription);
    const expected = 1;
    const listLength = await toDoList.getTasksListLength.call();
    assert.equal(listLength, expected, "Tasks list length should be 1.");
    
    const tasksList = await toDoList.getTasksList();
    assert.equal(
      tasksList[0].description,
      taskDescription,
      "Task description should match input."
    );
  });

  it("should test completing a task", async () => {
    await toDoList.completeTask(0);
    const tasksList = await toDoList.getTasksList();
    assert.isTrue(
      tasksList[0].done,
      "Newly created task should not be marked as done."
    );
  });
});