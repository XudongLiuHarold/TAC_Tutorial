//
//  LocationDemoTests.swift
//  LocationDemoTests
//
//  Created by Teng on 3/29/16.
//  Copyright © 2016 huoteng. All rights reserved.
//

import XCTest
@testable import LocationDemo

class LocationDemoTests: XCTestCase {
    
    let testModel = WeatherModel()
    var expectation:XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        self.expectation = self.expectation(withDescription: "Handler caller")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetWeather() {
        testModel.getWeather(39.93, lon: 116.4) { (cityName, weather) -> Void in
            XCTAssert("Beijing Shi" == cityName)
            self.expectation!.fulfill()
        }

        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
