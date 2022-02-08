import UIKit

func sum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

sum(num1: 5, num2: 5)

// Sum -> (Int,Int) -> Int

func calculate(num1: Int, num2: Int, function: (Int, Int) -> Int) -> Int{
    return function(num1, num2)
}

calculate(num1: 5, num2: 2, function: sum)

calculate(num1: 4, num2: 9, function: { (num1: Int, num2: Int) -> Int in
    return num1 * num2
})

calculate(num1: 4, num2: 9, function: { (x, y) -> Int in
    return x * y
})

calculate(num1: 4, num2: 9, function: { (x, y) in
    return x * y
})

calculate(num1: 4, num2: 11, function: { $0 * $1 })

let myArray = [10,20,30,40,50]

func test(num1: Int) -> Int {
    return num1 / 5
}

myArray.map(test)

print(myArray.map({$0 / 5}))
