//
//  Restaurants.swift
//  SmaakTests
//
//  Created by Tarun on 01/10/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//

import XCTest
@testable import Smaak

class RestaurantsTest: XCTestCase {

    func testRestaurants() {
        let testName = Restaurants(name: "Test Name", status: "Test status", bestMatch: 10, newest: 11, ratingAverage: 12.0, distance: 13, popularity: 14.0, averageProductPrice: 15, deliveryCosts: 16, minCost: 17, favourite: true, openStatus: 18)

        XCTAssertEqual(testName.name, "Test Name",
                       "Name should be set in initializer")
        
        XCTAssertEqual(testName.status, "Test status",
                       "Status should be set in initializer")
        
        XCTAssertEqual(testName.bestMatch, 10,
                       "bestMatch should be set in initializer")
        
        XCTAssertEqual(testName.newest, 11,
                       "newest should be set in initializer")
        
        XCTAssertEqual(testName.ratingAverage, 12.0,
                       "ratingAverage should be set in initializer")
        
        XCTAssertEqual(testName.distance, 13,
                       "distance should be set in initializer")
        
        XCTAssertEqual(testName.popularity, 14.0,
                       "popularity should be set in initializer")
        
        XCTAssertEqual(testName.averageProductPrice, 15,
                       "averageProductPrice should be set in initializer")
        
        XCTAssertEqual(testName.deliveryCosts, 16,
                       "deliveryCosts should be set in initializer")
        
        XCTAssertEqual(testName.favourite, true,
                       "favourite should be set in initializer")
        
        XCTAssertEqual(testName.openStatus, 18,
                       "openStatus should be set in initializer")
     
    }
    
}
