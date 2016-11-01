//: Playground - noun: a place where people can play

import Foundation

// Basic Founction with parameters
func display(parameter1: String, parameter2: String, para parameter3: Int) {
    print("\(parameter1),\(parameter2),\(parameter3)")
}
display(parameter1: "Huo", parameter2: "Teng", para: 10)

// Basic Founction with return values
func returnSomething() -> Bool {
    return true
}
print(returnSomething())

// ignore out parameter
func omitOutParameterName(_ name: String) {
    print(name)
}
omitOutParameterName("HuoTeng")
omitOutParameterName("dkfj")

func test() {
    
}

func returnValue() -> () -> () {
    return { () -> () in
        
    }
}

// Closure
func applyClosure(a: Int) -> (Int) -> Int {
    print(a)
    return { (c: Int) -> Int in
        return a + c
    }
}

let closure = applyClosure(a: 2)

let result = closure(3)
print(result)


print(closure(4))

// Closure in parameter
func parameterWishClosure(a: Int, b: Double, operation: (Int, Double) -> Int) {
    
    let result = operation(a, b)
    print("The result is \(result)")
}

func multiOperation(x: Int, y: Double) -> Int {
    return x * Int(y)
}

parameterWishClosure(a: 3, b: 2.2) { $0 + Int($1) }
parameterWishClosure(a: 3, b: 2.1, operation: multiOperation)

var num = 1


func convert(a: Int) -> Int {
    return 2
}

num = convert(a: num)

