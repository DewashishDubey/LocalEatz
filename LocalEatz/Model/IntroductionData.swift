//
//  IntroductionData.swift
//  LocalEatz
//
//  Created by Dewashish Dubey on 10/01/24.
//

import Foundation

struct IntroductionData: Identifiable,Hashable
{
    var id : UUID = .init()
    var title : String
    var subTitle : String
    var image : String
    
}

var Cards : [IntroductionData] = [
    .init(title: "Restaurant Recommendations", subTitle: "Local food recommendations for authentic dining experience", image: "image1"),
    .init(title: "New York", subTitle: "Planned itinerary for smooth travel", image: "image2"),
    .init(title: "Prague", subTitle: "Locate where your friends at", image: "image3")
]
