
struct Stack<T> {
    private var elements: [T] = []  // Array that stores elements in stack

    /* Returns true if stack is empty, false otherwise */
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
    let validChars: [Character] = [" ", ".", "+", "-", "*", "/", "^"]

    init() {
        stack = Stack<T>()
    }

    /* Ensure user input is a valid arithmetic operation */
    func checkInput(_ input: String) -> Bool {
        for char in input {
            if (char.wholeNumberValue != nil || validChars.contains(char)) {
                // Char is a whole number or valid character
                continue
            } else {
                // Char is NEITHER a whole number or valid character
                print("Invalid character: \(char)")
                return false
            }
        }
        return true
    }

}


/* Main Program */
func main() {
    let myCalc = Calculator<Double>()
    print("Welcome to the TI-327 Calculator...")
    print("Enter an arithmetic expression or 'exit' to quit: ")
    var inString: String = ""

    repeat {
        inString = readLine()!

        if (!myCalc.checkInput(inString)) {
            print("ERROR: Invalid input")
        } else {
            // Perform arithmetic
            print("Valid Input")
        }
    } while (inString != "exit")
}

main()
