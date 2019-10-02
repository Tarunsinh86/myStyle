//
//  FilterController.swift
//  Smaak
//
//  Created by Tarun on 29/09/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//

import UIKit


class FilterController: UITableViewController {
    
    /// Array use for sorting Type
    let arrAirData1 = ["Best Match", "Newest", "Rating average", "Distance" , "Popularity", "Average product price", "Delivery costs", "Minimum cost"]
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sorting Type";
    }

    // MARK: - Table view delegate and data source methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAirData1.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.Filter_Cell_height)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Filter_Cell_identifier, for: indexPath)
        cell.textLabel?.text = self.arrAirData1[indexPath.row]
        let selectedFilter = Constants.FilterTypeValue
        cell.tintColor = Constants.Theam_Color
        if(selectedFilter?.rawValue ?? "" == self.arrAirData1[indexPath.row]){
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.popViewController(animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            Constants.FilterTypeValue = Constants.FilterType(rawValue: self.arrAirData1[indexPath.row])
        }
    }
}

