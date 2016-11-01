//: Playground - noun: a place where people can play

import Foundation

// Array
let arrayNum = [1, 2, 3, 4, 1]
let arrayStr = ["abc", "def"]

// Set
let setNum = Set(arrayNum)
print(setNum)

// Dictionary
let dictionary: Dictionary<String, Any> = ["a": 1, "b": 2, "c": "1"]
print(dictionary["a"] as! Int)

// Tuple
let name = (firstname: "Teng", surname: "Huo")
print(name.firstname)
print(name.surname)
