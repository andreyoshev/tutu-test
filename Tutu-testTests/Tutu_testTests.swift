//
//  Tutu_testTests.swift
//  Tutu-testTests
//
//  Created by Андрей Ошев on 11.06.16.
//  Copyright © 2016 Andrey Oshev. All rights reserved.
//

import XCTest

class Tutu_testTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCityFillWithDict() {
        // Given
        let city = City()
        
        // When
        city.fillWithDict(self.stubCityDict())
        
        // Then
        XCTAssertEqual(city.title, self.stubCityDict()["cityTitle"] as? String)
        XCTAssertEqual(city.countryTitle, self.stubCityDict()["countryTitle"] as? String)
        XCTAssertEqual(city.stations.count, (self.stubCityDict()["stations"] as! [AnyObject]).count)
    }
    
    func testStationFillWithDict() {
        // Given 
        let station = Station()
        
        // When
        station.fillWithDict(self.stubStationDict1())
        
        // Then
        XCTAssertEqual(station.title, self.stubStationDict1()["stationTitle"] as? String)
    }
    
    func testCityCopyWithoutStatios() {
        // Given
        let city = City()
        city.fillWithDict(self.stubCityDict())
        
        // When
        let cityCopy = city.copyWithoutStations()
        
        // Then
        XCTAssertEqual(cityCopy.title, city.title)
        XCTAssertEqual(cityCopy.countryTitle, city.countryTitle)
    }
    
    func stubCityDict() -> [String: AnyObject] {
        let dict = ["countryTitle":"CountryTitle",
                    "cityTitle":"CityTitle",
                    "stations":[self.stubStationDict1(),
                                self.stubStationDict2()]]
        return dict
    }
    
    func stubStationDict1() -> [String: AnyObject] {
        let dict = ["stationTitle":"StationA"]
        return dict;
    }
    
    func stubStationDict2() -> [String: AnyObject] {
        let dict = ["stationTitle":"StationB"]
        return dict;
    }
}
