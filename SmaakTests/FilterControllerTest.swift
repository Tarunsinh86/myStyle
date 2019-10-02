//
//  FilterControllerTest.swift
//  SmaakTests
//
//  Created by Tarun on 02/10/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//

import XCTest
@testable import Smaak

class FilterControllerTest: XCTestCase {

    var controller: FilterController!
    var tableView: UITableView!
    var dataSource: UITableViewDataSource!
    var delegate: UITableViewDelegate!
    
    override func setUp() {
        super.setUp()
        ///Mock controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mockController = storyboard.instantiateViewController(withIdentifier: "FilterController") as! FilterController
        
        
        controller = mockController
        controller.loadViewIfNeeded()
        tableView = controller.tableView
        dataSource = tableView.dataSource
        delegate = tableView.delegate
    }

    
    func testTableViewCells() {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Filter_Cell_identifier)
        XCTAssertNotNil(cell,"TableView should be able to create cell with identifier: 'cell2'")
    }
    
    func testTableViewDelegateIsViewController() {
        XCTAssertTrue(tableView.delegate === controller,"Controller should be delegate for the table view")
    }
    
    func testOneSectionWhenDataArePresent() {
        XCTAssertEqual(dataSource.numberOfSections!(in: tableView), 1, "TableView should have one section when Restaurent are present")
    }
    
    func testNumberOfRows() {
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 8, "Number of rows in table should match number of resturants")
    }
}

