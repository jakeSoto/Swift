struct toDoItem{
    var task: String
    var dueDate: String
}

class TodoList{
    var toDoItems: [toDoItem] = []

    func addTask(task: String, dueDate: String){
        let newTask = toDoItem(task: task, dueDate: dueDate)
        toDoItems.append(newTask)
        print("added task: \(task)")
    }

    func completeTask(index: Int){
        if(index<toDoItems.count && index>=0){
            let completedTask = toDoItems.remove(at: index)
            print("completed task \(completedTask.task)")
        }
        else{
            print("invalid index")
        }
    }

    func displayList(){
        if (toDoItems.isEmpty) {
            print("your to do list is empty")
        }
        else{
            var count = 1;
            print("your to do list:")
            for toDoItem in toDoItems {
                print("\(count). Task: \(toDoItem.task), Due Date: \(toDoItem.dueDate)")
                count+=1;
            }
        }
    }
}

func main() {
    let myTodoList = TodoList()

    print("welcome to your to do list!")

    while true{
        print("OPTIONS----------------")
        print("1. add a new task")
        print("2. mark a task complete")
        print("3. display your to do list")
        print("4. quit program")
        
        var choice = readLine() ?? ""
        var option = Int(choice)
        while true{
            if(option == 1 || option == 2||option == 3||option == 4){
                break
            }
            print("invalid choice, pick again")
            choice = readLine() ?? ""
            option = Int(choice)
        }

        switch option{
            case 1:
                print("enter task")
                let userTask = readLine() ?? ""
                print("enter due date")
                let userDueDate = readLine() ?? ""
                myTodoList.addTask(task: userTask, dueDate: userDueDate)
            case 2:
                print("enter index of task completed, display your list to see indexes")
                if let userIndex = readLine(), var index = Int(userIndex){
                index-=1;
                myTodoList.completeTask(index: index)
                }
                else{
                    print("invalid input")
                }
            case 3:
                myTodoList.displayList()
            case 4:
                print("exiting program, have a great day!")
                return
            default:
                print("not a valid choice")
        }

        
    }
}


main()
