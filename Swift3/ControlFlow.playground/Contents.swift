//: Playground - noun: a place where people can play

import UIKit

var array = [1,2,3,4,5,6,7]

for number in array {
    print(number)
    var test = number
    test = 2
}

print(array)
// if else
// while

let number = 10
switch number {
case 0..<5:
    print("Number is less than 5")
case 5...10:
    print("Number is larger than 5")
default:
    print(number)
}

let dictionary = ["key1": 1, "key2": 2]
for (key, value) in dictionary {
    print("\(key),\(value)")
}

array.forEach { number in
    print(number)
}

let returnsArray = array.map { (number) -> String in
    let string = "name is" + "test" + "\n\(number)"
    return "\(number)"
}

let result = array.filter { (number) -> Bool in
    if number > 3 {
        return true
    }
    return false
}
