//
//  Restaurants.swift
//  Smaak
//
//  Created by Tarun on 28/09/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//

import UIKit

/// Model Object for Restaurants Information
class Restaurants {
    var name: String
    var status: String
    var bestMatch: Float?
    var newest: Float?
    var ratingAverage: Float?
    var distance: Int?
    var popularity: Float?
    var averageProductPrice: Int?
    var deliveryCosts: Int?
    var minCost: Int?
    var favourite: Bool?
    var openStatus: Int?

    
    /// Initiate Restaurants object
    ///
    /// - Parameters:
    ///   - name : Restaurants name
    ///   - status: Restaurants Status open/close
    ///   - bestMatch: Restaurants BestMatch
    ///   - newest: Newest Restaurants
    ///   - ratingAverage: RatingAverage about Restaurants
    ///   - distance: Distance about Restaurants
    ///   - popularity: Popularity about Restaurants
    ///   - averageProductPrice: AverageProductPrice of Restaurants
    ///   - deliveryCosts: DeliveryCosts of Restaurants
    ///   - minCost: Miniumcost of Restaurants
    ///   - favourite: To set favourite 
    ///   - openStatus: To check about openStatus


    init(name:String, status:String, bestMatch:Float, newest:Float, ratingAverage:Float, distance:Int, popularity:Float, averageProductPrice:Int, deliveryCosts:Int, minCost:Int, favourite:Bool, openStatus:Int) {
        self.name = name
        self.status = status
        self.bestMatch = bestMatch
        self.newest = newest
        self.ratingAverage = ratingAverage
        self.distance = distance
        self.popularity = popularity
        self.averageProductPrice = averageProductPrice
        self.deliveryCosts = deliveryCosts
        self.minCost = minCost
        self.favourite = favourite
        self.openStatus = openStatus

    }
}


