//
//  TennisEventResponse.swift
//  SportsApp
//
//  Created by Macos on 16/05/2025.
//

import Foundation
struct TennisEventResponse : Decodable{
    
    var result : [TennisEvent]?
    var success : Int
    
}
