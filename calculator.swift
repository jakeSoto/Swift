
struct Stack<T> {
    private var elements: [T] = []  // Array that stores elements in stack

    /* Boolean variable - returns true if stack is empty, false otherwise */
    var isEmpty: Bool {
        return elements.isEmpty
    }

    /* Push the given element to the top of the Stack */
    mutating func push(_ element: T) {
        elements.append(element)
    }

    /* Attempt to pop an element from the top of the Stack,
    and return the element */
    mutating func pop() -> T? {
        if !isEmpty {
            return elements.popLast()
        } else {
            print("ERROR: Cannot pop element from empty Stack")
            return nil
        }
    }

    /* Return the top element without popping it */
    func peek() -> T? {
        if !isEmpty {
            return elements.last
        } else {
            print("ERROR: Cannot peek element from empty Stack")
            return nil
        }
    }

    /* Clear the stack */
    mutating func clear() {
        elements.removeAll()
    }

}



class Calculator<T> {
    private var stack: Stack<T>

    init() {
        stack = Stack<T>()
    }


}


func main() {
    /*
    print("Testing the Stack...")
    var myStack = Stack<Int>()
    myStack.push(1)
    myStack.push(2)
    myStack.push(3)

    if let temp = myStack.peek() {
        print("Top element: \(temp)")
    }

    myStack.clear()
    if let temp = myStack.pop() {
        print("Top element: \(temp)")
    }

    print("Empty Stack? \(myStack.isEmpty)")
    print("Working")
    */

    print("Testing the Calculator....")
    var myCalc = Calculator<Double>()
    print("Created")
}

main()
