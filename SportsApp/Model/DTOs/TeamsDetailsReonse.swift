//
//  TeamsDetailsReonse.swift
//  SportsApp
//
//  Created by Macos on 18/05/2025.
//

import Foundation
struct TeamDetailsResponse : Decodable {
    var success : Int
    var result : [TeamDetailsItem]
}
