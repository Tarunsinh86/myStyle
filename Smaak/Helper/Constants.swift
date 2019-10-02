//
//  Constants.swift
//  Smaak
//
//  Created by Tarun on 29/09/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//


import UIKit

struct Constants {
    
    /// Enum for filtering Reasurant's list
    ///
    /// - FILTER_BEST_MATCH: FILTER_BEST_MATCH
    /// - FILTER_NEWEST: FILTER_NEWEST description
    /// - FILTER_RATING: FILTER_RATING description
    /// - FILTER_DISTANCE: FILTER_DISTANCE description
    /// - FILTER_POPULARITY: FILTER_POPULARITY description
    /// - FILTER_PRODUCT_PRICE: FILTER_PRODUCT_PRICE description
    /// - FILTER_DELIVERY_COST: FILTER_DELIVERY_COST description
    /// - FILTER_MINIUM_COST: FILTER_MINIUM_COST description
    enum FilterType : String {
        case FILTER_BEST_MATCH = "Best Match"
        case FILTER_NEWEST = "Newest"
        case FILTER_RATING = "Rating average"
        case FILTER_DISTANCE = "Distance"
        case FILTER_POPULARITY = "Popularity"
        case FILTER_PRODUCT_PRICE = "Average product price"
        case FILTER_DELIVERY_COST = "Delivery costs"
        case FILTER_MINIUM_COST = "Minimum cost"
    }
    
    /// Selected filter type
    static var FilterTypeValue : FilterType!
    
    
    /// Table Cell configration for Dashboard tableview
    static let Dashboard_Cell_Height = 76
    static let Dashboard_Identifier = "cell"
    
    /// Table Cell configration for Filter view tableview
    static let Filter_Cell_height = 40
    static let Filter_Cell_identifier = "cell2"
    
    static let Theam_Color = UIColor(red: (150/255.0), green: (66/255.0), blue: (29/255.0), alpha: 1.0)
}


