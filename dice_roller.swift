

struct Dice {
    var sides: [Int] = []
    var faces: [Int:String] = [:]

    init() {
        self.sides = [1,2,3,4,5,6]
        self.faces = [1:"-",
                    2:"⚁",
                    3:"⚂",
                    4:"⚃",
                    5:"⚄",
                    6:"⚅"]
    }

    private func getFace(index: Int) -> String {
        return self.faces[index]
    }

    func printSides() {
        for side in sides {
            if let face = self.getFace(index: side){
                print("\(face)")
            }
        }
    }


}


var dice = Dice()
dice.printSides()
