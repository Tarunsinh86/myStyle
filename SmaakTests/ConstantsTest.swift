//
//  ConstantsTest.swift
//  SmaakTests
//
//  Created by Tarun on 01/10/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//

import XCTest
@testable import Smaak

class ConstantsTest: XCTestCase {
    func testFilterTypeEnum() {
        
        XCTAssertEqual(Constants.FilterType.FILTER_BEST_MATCH, Constants.FilterType(rawValue: "Best Match"),
                       "FILTER_BEST_MATCH should be set in initializer")
        
        XCTAssertEqual(Constants.FilterType.FILTER_NEWEST, Constants.FilterType(rawValue: "Newest"),
                       "FILTER_NEWEST should be set in initializer")
        
        XCTAssertEqual(Constants.FilterType.FILTER_RATING, Constants.FilterType(rawValue: "Rating average"),
                       "FILTER_RATING should be set in initializer")
        
        XCTAssertEqual(Constants.FilterType.FILTER_DISTANCE, Constants.FilterType(rawValue: "Distance"),
                       "FILTER_DISTANCE should be set in initializer")
        
        XCTAssertEqual(Constants.FilterType.FILTER_POPULARITY, Constants.FilterType(rawValue: "Popularity"),
                       "FILTER_POPULARITY should be set in initializer")
        
        XCTAssertEqual(Constants.FilterType.FILTER_PRODUCT_PRICE, Constants.FilterType(rawValue: "Average product price"),
                       "FILTER_BEST_MATCH should be set in initializer")
        
        XCTAssertEqual(Constants.FilterType.FILTER_DELIVERY_COST, Constants.FilterType(rawValue: "Delivery costs"),
                       "FILTER_DELIVERY_COST should be set in initializer")
        
        XCTAssertEqual(Constants.FilterType.FILTER_MINIUM_COST, Constants.FilterType(rawValue: "Minimum cost"),
                       "FILTER_MINIUM_COST should be set in initializer")
        
    }
    
    func testFilterTypeValue() {
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "Minimum cost")
        XCTAssertEqual(Constants.FilterTypeValue, Constants.FilterType(rawValue: "Minimum cost"),
                       "FilterTypeValue should be set in initializer")
    }
    
    func testDAshboardCell() {
        XCTAssertEqual(Constants.Dashboard_Cell_Height, 90,
                       "Dashboard_Cell_Height should be set properly")
        
        XCTAssertEqual(Constants.Dashboard_Identifier, "cell",
                       "Dashboard_Identifier should be set properly")
    }
    
    func testFilterCell() {
        XCTAssertEqual(Constants.Filter_Cell_height, 40,
                       "Filter_Cell_height should be set properly")
        
        XCTAssertEqual(Constants.Filter_Cell_identifier, "cell2",
                       "Filter_Cell_identifier should be set properly")
    }
}
