//
//  RestaurantData.swift
//  LocalEatz
//
//  Created by Dewashish Dubey on 21/01/24.
//

import Foundation
struct RestaurantData: Identifiable
{
    var id : UUID = .init()
    var image: String
    var restaurantName : String
    var rating: String
    var numberOfRatings : String
    var timimg: String
    var famousFood : [String]
}

var Restaurantcards : [RestaurantData] = [
    RestaurantData(image: "dhaba", restaurantName: "Gulshan Dhaba", rating: "4.3", numberOfRatings: "(35+)", timimg: "10-15 mins", famousFood: ["Fish Fry","Fast Food"]),
    RestaurantData(image: "garg", restaurantName: "Garg Chaat", rating: "4.2", numberOfRatings: "(20+)", timimg: "10 mins", famousFood: ["Fish Fry","Fast Food"]),
    RestaurantData(image: "35", restaurantName: "35 Brewhouse", rating: "5.0", numberOfRatings: "(180+)", timimg: "25 mins", famousFood: ["Vegetarian Friendly", "Vegan Options"])
]
