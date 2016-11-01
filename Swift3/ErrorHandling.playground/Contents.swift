//: Playground - noun: a place where people can play

import Foundation

enum MyError: Error {
    case networkUnreachable
    case dataFormatError
    case unknowError
}

func checkStatus(currentStatus: Int) throws {
    
    if 0 == currentStatus {
        print("Normal")
    } else if 1 == currentStatus {
        throw MyError.networkUnreachable
    } else if 2 == currentStatus {
        throw MyError.dataFormatError
    } else {
        throw MyError.unknowError
    }
}

do {
    try checkStatus(currentStatus: 0)
    print("Check Completed")
} catch MyError.networkUnreachable {
    print("Please Check Network")
} catch MyError.dataFormatError {
    print("Data Format Error")
} catch MyError.unknowError {
    print("Unknow Error")
} catch {
    print(error)
    error.localizedDescription
}

func testRethrows(block: () throws -> ()) rethrows {
    try block()
}

func handling() throws {
    print("handling")

    throw MyError.dataFormatError
}

func noError() {
    
}

try testRethrows(block: handling)
testRethrows(block: noError)