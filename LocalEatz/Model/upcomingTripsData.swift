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
    upcomingTripsData(placeName: "Pondicherry", placeDate: "4 MARCH - 8 MARCH", knowMore: "Know more", placeImage: "mumbai"),
    upcomingTripsData(placeName: "Chennai", placeDate: "3 MARCH - 5 MARCH", knowMore: "Know more", placeImage: "mumbai")
]
