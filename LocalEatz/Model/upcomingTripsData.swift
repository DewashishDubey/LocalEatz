//
//  upcomingTripsData.swift
//  LocalEatz
//
//  Created by Dewashish Dubey on 21/01/24.
//

import Foundation

struct upcomingTripsData: Identifiable
{
    var id: UUID = .init()
    var placeName : String
    var placeDate : String
    var knowMore : String
    var placeImage : String
}

var upcomingTripsCard : [upcomingTripsData] = [
    upcomingTripsData(placeName: "Mumbai", placeDate: "15 JAN - 19 JAN", knowMore: "Know more", placeImage: "mumbai"),
    upcomingTripsData(placeName: "Lucknow", placeDate: "18 NOW - 19 NOV", knowMore: "Know more", placeImage: "lucknow")
]
