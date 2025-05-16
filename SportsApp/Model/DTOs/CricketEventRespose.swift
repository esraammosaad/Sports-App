//
//  CricketEventRespose.swift
//  SportsApp
//
//  Created by Macos on 16/05/2025.
//

import Foundation

class CricketEventResponse : Decodable{
    
    var result : [CricketEvent]?
    var success : Int
    
}
