import Foundation

struct Stack<String> {
    private var elements: [String] = []  // Array that stores elements in stack

    /* Returns true if stack is empty, false otherwise */
    var isEmpty: Bool {
        return elements.isEmpty
    }

    /* Push the given element to the top of the Stack */
    mutating func push(_ element: String) {
        elements.append(element)
    }

    /* Attempt to pop an element from the top of the Stack,
    and return the element */
    mutating func pop() -> String? {
        if !isEmpty {
            return elements.popLast()
        } else {
            print("ERROR: Cannot pop element from empty Stack")
            return nil
        }
    }

    /* Return the top element without popping it */
    func peek() -> String? {
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
    private var stack: Stack<String>
    private var hold_stack: Stack<String>
    
    private var operators: [String] = ["^", "*", "/", "+", "-"]
    let validChars: [Character] = [" ", ".", "+", "-", "*", "/", "^"]

    init() {
        stack = Stack<String>()
        hold_stack = Stack<String>()
    }

    /* Ensure user input is a valid arithmetic sequence */
    func checkInput(_ input: String) -> Bool {
        //Tokenizes input
        let modInput:NSString = NSString(string:input)
        var num = 0
        let tokens = modInput.components(separatedBy: " ")
        //Loops through input 
        for token in tokens {
            //if num % 2 == 0 char should be a operand
            if (num % 2 == 0){
                var bool = true
                //Checks that each character is a whole number
                for char in token{
                    if(!(char.wholeNumberValue != nil)){
                        // Char is a whole number
                        bool = false
                    }
                }
                if (bool){
                    // Token is a whole number
                    num += 1
                    stack.push(token)
                    continue
                }
                else{
                    // Token is not a whole number
                    print("Invalid operand: \(token)")
                    stack.clear()
                    return false
                }
            }
            //else char is operator
            else{
                if(operators.contains(token)){
                    //Char is valid operator
                    num += 1
                    stack.push(token)
                    continue
                }
                else{
                    // Char is NEITHER a whole number or valid character
                    print("Invalid operator: \(token)")
                    stack.clear()
                    return false
                }
            }
        }
        // If sequence ends in a operand = valid
        if (num % 2 == 1){
            while(!stack.isEmpty){
                hold_stack.push(stack.pop()!)
            }
            stack = hold_stack
            hold_stack.clear()
            return true
        }
        // If sequence ends in operator = invalid
        else{
            stack.clear()
            return false
        }
    }


    func performOperation(){
        for op in operators{
            hold_stack.push(stack.pop()!)
            while(!stack.isEmpty){
                let cur_op = stack.pop()
                if cur_op == op{
                    switch cur_op{
                        case "+":
                            hold_stack.push(String(Int(hold_stack.pop()!)! + Int(stack.pop()!)!))
                        case "-":
                            hold_stack.push(String(Int(hold_stack.pop()!)! - Int(stack.pop()!)!))
                        case "*":
                            hold_stack.push(String(Int(hold_stack.pop()!)! * Int(stack.pop()!)!))
                        case "/":
                            hold_stack.push(String(Int(hold_stack.pop()!)! / Int(stack.pop()!)!))
                        case "^":
                            hold_stack.push(String(Int(pow(Double(hold_stack.pop()!)!, Double(stack.pop()!)!))))
                        default:
                            print("unkown operator")
                    }
                }
                else{
                    hold_stack.push(cur_op!)
                    hold_stack.push(stack.pop()!)
                }
            }
            while(!hold_stack.isEmpty){
                stack.push(hold_stack.pop()!)
            }
        }
        print(stack.peek()!)
        stack.clear()
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
        } 
        else {
            // Perform arithmetic
            print("Valid Input: Calculating...")
            myCalc.performOperation()
        }
    } while (inString != "exit")
}

main()
