//
//  DashboardController.swift
//  Smaak
//
//  Created by Tarun on 28/09/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//


/// Re-usable static keys
let KEY_SORTINGVALUES = "sortingValues"


import UIKit
class DashboardController: UITableViewController {
    /// Array use for visulization and sorting - Type customize Restaurants object
    var arrResturentData : [Restaurants] = []

    // MARK: - Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupResturentInformation()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sortRestaurantsData()
    }
    
    // MARK: - Setup methods
    
    /// Setup View to default
    func setupView(){
        self.title = "Restaurants";
        navigationController?.navigationBar.barTintColor = Constants.Theam_Color
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        //Table view default setup
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = false;
        
        //Default filter setup - {Faverout + Opestatus + ALphabetic}
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "")
        
        //Pull to refresh functionality to set as default restaurants list
        refreshToDefault()
    }
    
    /// Pull to refresh functionality to make default refresh function
    func refreshToDefault() {
        refreshControl = UIRefreshControl()
        refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl!.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.tableView.addSubview(refreshControl!)
    }
    
  
    // MARK: - JSON Parsing Setup
    /**
     To get Restaurants information from JSON
     */
    func setupResturentInformation(){
        GenericClass.getResturentData { (arrResturentData) in
            print("Finished all requests.")
            self.arrResturentData = arrResturentData
            self.sortRestaurantsData()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Sorting Functionality

    /// Sorting RestaurantsData with different Type
    @objc private func sortRestaurantsData(){
        var tempSortedRestaurant : [Restaurants] = []
        tempSortedRestaurant = GenericClass.sortRestaurantsData(resturantArrayForSorting: self.arrResturentData)
        refreshControl!.endRefreshing()
        self.arrResturentData.removeAll()
        self.arrResturentData = tempSortedRestaurant
        self.tableView.reloadData()
    }
    
    // MARK: - Table view delegate and data source methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrResturentData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.Dashboard_Cell_Height)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Dashboard_Identifier) as? TableCell else {
            return UITableViewCell()
        }
        cell.lblName.text = self.arrResturentData[indexPath.row].name
        cell.lblStatus.text =  self.arrResturentData[indexPath.row].status
        switch Constants.FilterTypeValue {
        case .FILTER_BEST_MATCH?:
            cell.lblSorting.text =  "Best Match : " + (NSString(format: "%.2f", self.arrResturentData[indexPath.row].bestMatch ?? 0.0) as String)
        case .FILTER_NEWEST?:
            cell.lblSorting.text =  "Newest: " + (NSString(format: "%.2f", self.arrResturentData[indexPath.row].newest ?? 0.0) as String)
        case .FILTER_RATING?:
            cell.lblSorting.text =  "Average Rating: " + (NSString(format: "%.2f", self.arrResturentData[indexPath.row].ratingAverage ?? 0.0) as String)
        case .FILTER_DISTANCE?:
            cell.lblSorting.text =  "Total Distance: " + (NSString(format: "%d", self.arrResturentData[indexPath.row].distance ?? 0) as String)
        case .FILTER_POPULARITY?:
            cell.lblSorting.text =  "Popularity: " + (NSString(format: "%.2f", self.arrResturentData[indexPath.row].popularity ?? 0.0) as String)
        case .FILTER_PRODUCT_PRICE?:
            cell.lblSorting.text =  "Average Price: " + (NSString(format: "%d", self.arrResturentData[indexPath.row].averageProductPrice ?? 0) as String)
        case .FILTER_DELIVERY_COST?:
            cell.lblSorting.text =  "Delivery Cost: " + (NSString(format: "%d", self.arrResturentData[indexPath.row].deliveryCosts ?? 0) as String)
        case .FILTER_MINIUM_COST?:
            cell.lblSorting.text =  "Minimum Cost: " + (NSString(format: "%d", self.arrResturentData[indexPath.row].minCost ?? 0) as String)
        case .none:
            cell.lblSorting.text =  "No Filter Applied"
        }
        
        cell.viewCell = self.setLayerOnView(objView: cell.viewCell)
        cell.btnFaverout.tag = indexPath.row
        cell.btnFaverout.addTarget(self, action: #selector(self.actionLikeButton(_:)), for: .touchUpInside)
        if(self.arrResturentData[indexPath.row].favourite ?? false){
            cell.btnFaverout.setImage(UIImage(named: "heart_like.png"), for: .normal)

        }else{
            cell.btnFaverout.setImage(UIImage(named: "heart_normal.png"), for: .normal)
        }
        return cell
    }
    
    // MARK: - Actions
    
    /// Action : Pull to Refresh action
    ///
    /// - Parameter sender: delegate of refresh action
    @objc func refresh(_ sender: Any) {
        Constants.FilterTypeValue = Constants.FilterType(rawValue: "")//Set filter as default
        sortRestaurantsData()
    }
    
    /// Set Faverout
    ///
    /// - Parameter sender: Index path of like button
    @objc func actionLikeButton(_ sender:UIButton!){
        if(self.arrResturentData[sender.tag].favourite ?? false){
            self.arrResturentData[sender.tag].favourite = false
        }
        else{
            self.arrResturentData[sender.tag].favourite = true
        }
        self.tableView.reloadData()
    }
    
    
    // MARK: - Methods
    
    /// Set Cosmatic layer on cell
    ///
    /// - Parameter objView: uiview
    /// - Returns: uiview
    func setLayerOnView(objView: UIView) -> (UIView) {
        objView.layer.masksToBounds = true
        objView.layer.cornerRadius = 4.0
        objView.layer.borderWidth = 1.0
        objView.layer.borderColor = Constants.Theam_Color.cgColor
        return objView
    }
}
