//
//  GenericClassTest.swift
//  SmaakTests
//
//  Created by Tarun on 01/10/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//

import XCTest
@testable import Smaak

class GenericClassTest: XCTestCase {
    var arrTestResturant : [Restaurants] = []
    override func setUp() {
        let testData1 = Restaurants(name: "Test Name1", status: "Test status1", bestMatch: 10, newest: 10, ratingAverage: 12.0, distance: 11, popularity: 12.0, averageProductPrice: 10, deliveryCosts: 11, minCost: 11, favourite: true, openStatus: 1)
        
        let testData2 = Restaurants(name: "Test Name2", status: "Test status2", bestMatch: 12, newest: 12, ratingAverage: 10.0, distance: 10, popularity: 10.0, averageProductPrice: 11, deliveryCosts: 12, minCost: 12, favourite: false, openStatus: 3)
        
        let testData3 = Restaurants(name: "Test Name3", status: "Test status3", bestMatch: 11, newest: 11, ratingAverage: 11.0, distance: 12, popularity: 11.0, averageProductPrice: 12, deliveryCosts: 10, minCost: 10, favourite: true, openStatus: 2)
        
         arrTestResturant = [testData1, testData2, testData3]
    }

    func testSortRestaurantsBestmatch () {
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "Best Match")
        let testTempSortedRestaurant : [Restaurants] = GenericClass.sortRestaurantsData(resturantArrayForSorting: arrTestResturant)

        XCTAssertEqual(testTempSortedRestaurant[0].bestMatch, 12,
                    "Best match should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[1].bestMatch, 11,
                       "Best match should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[2].bestMatch, 10,
                       "Best match should be orderd")
    }
    
    func testSortRestaurantsNewest () {
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "Newest")
        let testTempSortedRestaurant : [Restaurants] = GenericClass.sortRestaurantsData(resturantArrayForSorting: arrTestResturant)
        
        XCTAssertEqual(testTempSortedRestaurant[0].newest, 12,
                       "Newest should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[1].newest, 11,
                       "Newest should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[2].newest, 10,
                       "Newest should be orderd")
    }
    
    func testSortRestaurantRatingAverage () {
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "Rating average")
        let testTempSortedRestaurant : [Restaurants] = GenericClass.sortRestaurantsData(resturantArrayForSorting: arrTestResturant)
        
        XCTAssertEqual(testTempSortedRestaurant[0].ratingAverage, 12.0,
                       "Rating average should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[1].ratingAverage, 11.0,
                       "Rating average should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[2].ratingAverage, 10.0,
                       "Rating average should be orderd")
    }
    
    func testSortRestaurantDistance () {
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "Distance")
        let testTempSortedRestaurant : [Restaurants] = GenericClass.sortRestaurantsData(resturantArrayForSorting: arrTestResturant)
        
        XCTAssertEqual(testTempSortedRestaurant[0].distance, 12,
                       "Distance should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[1].distance, 11,
                       "Distance should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[2].distance, 10,
                       "Distance should be orderd")
    }
    
    func testSortRestaurantPopularity () {
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "Popularity")
        let testTempSortedRestaurant : [Restaurants] = GenericClass.sortRestaurantsData(resturantArrayForSorting: arrTestResturant)
        
        XCTAssertEqual(testTempSortedRestaurant[0].popularity, 12.0,
                       "Popularity average should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[1].popularity, 11.0,
                       "Popularity average should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[2].popularity, 10.0,
                       "Popularity average should be orderd")
    }
    
    func testSortRestaurantAverageProductPrice () {
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "Average product price")
        let testTempSortedRestaurant : [Restaurants] = GenericClass.sortRestaurantsData(resturantArrayForSorting: arrTestResturant)
        
        XCTAssertEqual(testTempSortedRestaurant[0].averageProductPrice, 12,
                       "Average product price should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[1].averageProductPrice, 11,
                       "Average product price should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[2].averageProductPrice, 10,
                       "Average product price should be orderd")
    }
    
    func testSortRestaurantDeliveryCosts () {
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "Delivery costs")
        let testTempSortedRestaurant : [Restaurants] = GenericClass.sortRestaurantsData(resturantArrayForSorting: arrTestResturant)
        
        XCTAssertEqual(testTempSortedRestaurant[0].deliveryCosts, 12,
                       "DeliveryCosts should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[1].deliveryCosts, 11,
                       "DeliveryCosts should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[2].deliveryCosts, 10,
                       "DeliveryCosts should be orderd")
    }
    
    func testSortRestaurantMinCost () {
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "Minimum cost")
        let testTempSortedRestaurant : [Restaurants] = GenericClass.sortRestaurantsData(resturantArrayForSorting: arrTestResturant)
        
        XCTAssertEqual(testTempSortedRestaurant[0].minCost, 12,
                       "Minimum cost should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[1].minCost, 11,
                       "Minimum cost should be orderd")
        
        XCTAssertEqual(testTempSortedRestaurant[2].minCost, 10,
                       "Minimum cost should be orderd")
    }
    
    func testJSONParser () {
        GenericClass.getResturentData { (arrResturentData) in
            XCTAssertNotNil(arrResturentData)
        }
    }
}
