/*
    This example shows how to print to the console, create a function,
    generate a for-loop, accept user input, and type-cast variables
*/

print("Hello, World!\n")

print("Creating a function...")
func addUserInput() -> Int {
    var sum: Int = 0

    for _ in 1...2 {
        print("Enter an integer to add: ")

        if let temp = Int(readLine()!) {
            sum += temp
        }
        else {
            print("The input is not a valid integer")
        }
    }
    return sum
}

var mySum = addUserInput()
print("Sum of user Input: \(mySum)")

