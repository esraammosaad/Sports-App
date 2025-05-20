//
//  CricketEventRespose.swift
//  SportsApp
//
//  Created by Macos on 16/05/2025.
//

import Foundation

struct CricketEventResponse : Decodable{
    
    var result : [CricketEvent]?
    var success : Int?
    
}
