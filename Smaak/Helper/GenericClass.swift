//
//  GenericClass.swift
//  Smaak
//
//  Created by Tarun on 28/09/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//



import UIKit

class GenericClass {
    
    // MARK: - JSON Parsing

    /// Generic Controller to get Json parsing data
    ///
    /// - Parameter block: Return parsed data
    static func getResturentData(block : @escaping (( Array<Restaurants>) -> ())) {
        var arrResturentRowData = [Restaurants]()
        var arrResturentData = [Restaurants]()
        
        if let path = Bundle.main.path(forResource: "resturents", ofType: "json") {
            do {
                let dataResturent = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResturentResult = try JSONSerialization.jsonObject(with: dataResturent, options: .mutableLeaves)
                if let jsonResturentResult = jsonResturentResult as? Dictionary<String, AnyObject>, let restaurants = jsonResturentResult["restaurants"] as?  [Dictionary<String,Any>] {
                    for restaurant in restaurants{
                        guard let name = restaurant["name"] as? String else { return }
                        guard let status = restaurant["status"] as? String else { return }
                        guard let bestMatch = (restaurant[KEY_SORTINGVALUES] as? [String: Any])?["bestMatch"] as? Float else { return }
                        guard let newest = (restaurant[KEY_SORTINGVALUES] as? [String: Any])?["newest"] as? Float else { return }
                        guard let ratingAverage = (restaurant[KEY_SORTINGVALUES] as? [String: Any])?["ratingAverage"] as? Float else { return }
                        guard let distance = (restaurant[KEY_SORTINGVALUES] as? [String: Any])?["distance"] as? Int else { return }
                        guard let popularity = (restaurant[KEY_SORTINGVALUES] as? [String: Any])?["popularity"] as? Float else { return }
                        guard let averageProductPrice = (restaurant[KEY_SORTINGVALUES] as? [String: Any])?["averageProductPrice"] as? Int else { return }
                        guard let deliveryCosts = (restaurant[KEY_SORTINGVALUES] as? [String: Any])?["deliveryCosts"] as? Int else { return }
                        guard let minCost = (restaurant[KEY_SORTINGVALUES] as? [String: Any])?["minCost"] as? Int else { return }
                        let favourite = false
                        var openStatus:Int
                        if(status == "open"){openStatus=1}
                        else if (status == "order ahead"){openStatus=2}
                        else{openStatus=3}
                        
                        let resturentObject = Restaurants(name: name, status: status, bestMatch: bestMatch, newest: newest, ratingAverage: ratingAverage, distance: distance, popularity: popularity, averageProductPrice: averageProductPrice, deliveryCosts: deliveryCosts, minCost: minCost, favourite:favourite, openStatus:openStatus)
                        
                        print(resturentObject)
                        
                        arrResturentRowData.append(resturentObject)
                    }
                    DispatchQueue.main.async {
                        arrResturentData = arrResturentRowData
                        block(arrResturentData)
                    }
                }
            } catch let error as NSError {
                print(error)
            }
        }
    }
    
    // MARK: - Sorting Functionality
    
    /// Sorting RestaurantsData with different Type
    /// Sorting Functionality - Sorting RestaurantsData with different Type
    ///
    /// - Parameter resturantArrayForSorting: Restaurants array non sorted
    /// - Returns: Sorted Restaurants array
    static func sortRestaurantsData(resturantArrayForSorting : Array<Restaurants>) -> Array<Restaurants>{
        var tempSortedRestaurant : [Restaurants] = resturantArrayForSorting
        
        switch Constants.FilterTypeValue {
        case .FILTER_BEST_MATCH?:
            print("FILTER_BEST_MATCH 0") // default case is not needed
            tempSortedRestaurant = tempSortedRestaurant.sorted {
                Double($0.bestMatch ?? 0) > Double($1.bestMatch ?? 0)
            }
            
        case .FILTER_NEWEST?:
            print("FILTER_NEWEST 1") // default case is not needed
            tempSortedRestaurant = tempSortedRestaurant.sorted {
                Double($0.newest ?? 0) > Double($1.newest ?? 0)
            }
        case .FILTER_RATING?:
            print("FILTER_RATING 2") // default case is not needed
            tempSortedRestaurant = tempSortedRestaurant.sorted {
                Double($0.ratingAverage ?? 0) > Double($1.ratingAverage ?? 0)
            }
        case .FILTER_DISTANCE?:
            print("FILTER_DISTANCE 3") // default case is not needed
            tempSortedRestaurant = tempSortedRestaurant.sorted {
                Double($0.distance ?? 0) > Double($1.distance ?? 0)
            }
        case .FILTER_POPULARITY?:
            print("FILTER_POPULARITY 4") // default case is not needed
            tempSortedRestaurant = tempSortedRestaurant.sorted {
                Double($0.popularity ?? 0) > Double($1.popularity ?? 0)
            }
        case .FILTER_PRODUCT_PRICE?:
            print("FILTER_PRODUCT_PRICE 5") // default case is not needed
            tempSortedRestaurant = tempSortedRestaurant.sorted {
                Double($0.averageProductPrice ?? 0) > Double($1.averageProductPrice ?? 0)
            }
        case .FILTER_DELIVERY_COST?:
            print("FILTER_DELIVERY_COST 6") // default case is not needed
            tempSortedRestaurant = tempSortedRestaurant.sorted {
                Double($0.deliveryCosts ?? 0) > Double($1.deliveryCosts ?? 0)
            }
        case .FILTER_MINIUM_COST?:
            print("FILTER_MINIUM_COST 7") // default case is not needed
            tempSortedRestaurant = tempSortedRestaurant.sorted {
                Double($0.minCost ?? 0) > Double($1.minCost ?? 0)
            }
        case .none:
            print("Normal Filter") // default case is not needed
            tempSortedRestaurant = tempSortedRestaurant.sorted {
                ($0.name) < ($1.name)
            }
            tempSortedRestaurant = tempSortedRestaurant.sorted {
                Double($0.openStatus ?? 0) < Double($1.openStatus ?? 0)
            }
            tempSortedRestaurant.sort { $0.favourite! && !$1.favourite!}
        }
        return tempSortedRestaurant
    }
}
