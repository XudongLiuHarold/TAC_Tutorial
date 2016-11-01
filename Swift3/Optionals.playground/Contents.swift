//: Playground - noun: a place where people can play

import Foundation

var age: Int? = 1
print("\(age)")
print(age!)

age = nil
print("\(age)")
// print(age!) // Error, age is nil, can not be unwrapped

age = 12
print("\(age)")

if let theAge = age {
    // theAge is real value, not optional
    print("Age has real value:\(theAge)")
} else {
    print("Age is nil")
}
