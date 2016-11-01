//: Playground - noun: a place where people can play

import UIKit

enum Class {
    case level1
    case level2
    case level3
}

enum Season: Int {
    case spring = 3
    case summer = 2
    case autumn = 4
    case winter
}

let season = Season.summer
season.rawValue

enum API {
    case get(url: String)
    case post(url: String, parameter: Dictionary<String, String>)
    case delete
    case other(unknow: String)
}

let request = API.get(url: "http://www.sina.com")

switch request {
case .get(let url):
    print(url)
case .post(_, let prarmeters):
    print(prarmeters)
case .delete:
    print("")
case .other:
    print("unknow")
}

extension API {
    func getDetail() {
        print("hello")
    }
}

request.getDetail()

