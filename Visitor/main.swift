import Foundation

struct Visitor{
    var name: String
    var age: Int
    var visits: Int {
        didSet{
            bonusPoints += 1
            if visits % 10 == 0 && discountPercentage < 25  {
                discountPercentage += 5
                
            }
        }
    }
    var bonusPoints: Int
    var isRegularCustomer: Bool {
        return visits > 5
    }
    var discountPercentage: Int = 0
    
    
    
    func printInfo() {
        print("Ім'я: \(name)\nВік: \(age)\nКількість відвідувань: \(visits)\nБонусні бали: \(bonusPoints)\nВідсоток знижки: \(discountPercentage)%")
    }
    
    
    
    
}

var visitors: [ Visitor] = [
    Visitor(name: "Іван", age: 30, visits: 10, bonusPoints: 10, discountPercentage: 5),
    Visitor(name: "Марія", age: 25, visits: 15, bonusPoints: 15, discountPercentage: 5),
    Visitor(name: "Олексій", age: 40, visits: 30, bonusPoints: 30, discountPercentage: 15)
]




func printInfoForAllVisitors(_ visitors: [Visitor]) {
    for visitor in visitors {
        visitor.printInfo()
        print("------------------")
        
    }
    
    print("Загальна кількість бонусних балів: \(totalBonusPoints())")
    print("Середній вік відвідувачів: \(averageAge())")
}

func totalBonusPoints() -> Int {
    var totalPoints = 0
    for visitor in visitors {
        totalPoints += visitor.bonusPoints
    }
    return totalPoints
}

func averageAge() -> Int {
    var totalAge = 0
    for visitor in visitors {
        totalAge += visitor.age
    }
    return Int(totalAge) / Int(visitors.count)
}
    


printInfoForAllVisitors(visitors)

visitors.append(Visitor(name: "Наталя", age: 35, visits: 1, bonusPoints: 1))
print("\nНовий відвідувач доданий!\n")

for index in 0..<visitors.count {
    visitors[index].visits += 1
}
printInfoForAllVisitors(visitors)



    


