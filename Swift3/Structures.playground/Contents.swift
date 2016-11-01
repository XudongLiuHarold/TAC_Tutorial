//: Playground - noun: a place where people can play

import Foundation

struct Coordinate {
    var latitude: Double
    var longitude: Double
    
    var location: Double {
        get {
            return latitude + longitude
        }
        
        set {
            print(newValue)
        }
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init () {
        latitude = 0
        longitude = 0
    }
    
    init?(lat: Double, long: Double) {
        guard lat > 0 && long > 0 else {
            return nil
        }
        
        guard lat > 180 || long > 90 else {
            return nil
        }
        
        // The simple expression
        guard
            lat > 0 && long > 0,
            lat > 180 || long > 90 else {
                return nil
        }
        
        self.latitude = lat
        self.longitude = long
    }
    
    func toString() -> String {
        return "Latitude:\(latitude), Longitude:\(longitude)"
    }
}


var test = Coordinate()
test.location = 1
test.location

let myLocation = Coordinate(latitude: 39.0, longitude: 119.1)
print(myLocation.toString())

let errorLocation = Coordinate(lat: -10, long: 10)
print("\(errorLocation)")

class Student {
    var name: String
     var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func growUp() {
        self.age += 1
    }
    
    func getAge() -> Int {
        return self.age
    }
    
    var currentAge: Int {
        get {
            return  self.age
        }
        set {
            age = newValue
        }
    }
}

let xiaoming = Student(name: "Xiao Ming", age: 12)
xiaoming.growUp()
print(xiaoming.getAge())
print(xiaoming.currentAge)

xiaoming.currentAge = 10
xiaoming.age

var coordi = Coordinate()
coordi.latitude = 10.0
