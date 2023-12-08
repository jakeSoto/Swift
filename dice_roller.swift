
class Dice {
    private var sides: [Int:String] = [:]

    /* Constructor initializing a 6-sided die and its faces */
    init() {
        self.sides = [1:"⚀",
                    2:"⚁",
                    3:"⚂",
                    4:"⚃",
                    5:"⚄",
                    6:"⚅"]
    }

    /* If the index exists as a key in the dictionary, return the corresponding value,
    Else return empty string */
    private func getFace(index: Int) -> String {
        let temp: String? = self.sides[index]
        return temp ?? ""
    }


    /* Returns tuple containing the Integer value of the roll,
    and the corresponding String representation of the dice face */
    func rollDice() -> (Int, String) {
        let num = Int.random(in: 1...sides.count)
        return (num, self.getFace(index:num))
    }

}



/* Main Program */
func main() {
    var myDice: [Int:Dice] = [:]    // Dictionary matching Integer key to Dice object
    var rollSum: Int = 0            // Integer to add the result of each dice roll

    for i in 1...2 {
        let currentDie = Dice()
        myDice[i] = currentDie

        let rollResult = currentDie.rollDice()
        rollSum += rollResult.0
        print("Roll \(i): \(rollResult.1)")
    }

    print("Sum of dice rolls: \(rollSum)")
}

main()
