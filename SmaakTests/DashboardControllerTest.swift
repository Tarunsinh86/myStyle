//
//  DashboardControllerTest.swift
//  SmaakTests
//
//  Created by Tarun on 01/10/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//

import XCTest
@testable import Smaak

class DashboardControllerTest: XCTestCase {

    var controller: DashboardController!
    var tableView: UITableView!
    var dataSource: UITableViewDataSource!
    var delegate: UITableViewDelegate!
    
    override func setUp() {
        super.setUp()
        ///Mock controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mockController = storyboard.instantiateViewController(withIdentifier: "DashboardController") as! DashboardController
        
        
        controller = mockController
        controller.loadViewIfNeeded()
        tableView = controller.tableView
        dataSource = tableView.dataSource
        delegate = tableView.delegate
    }

    
    func testTableViewCells() {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Dashboard_Identifier) as? TableCell
        
        XCTAssertNotNil(cell,
                        "TableView should be able to create cell with identifier: 'Cell'")
    }
    
    func testTableViewDelegateIsViewController() {
        XCTAssertTrue(tableView.delegate === controller,
                      "Controller should be delegate for the table view")
    }
    
    func testOneSectionWhenDataArePresent() {
        XCTAssertEqual(dataSource.numberOfSections!(in: tableView), 1,
                       "TableView should have one section when Restaurent are present")
    }
    
    func testNumberOfRows() {
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 0,
                       "Number of rows in table should match number of resturants")
    }
}
