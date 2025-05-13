//
//  LeagueResponse.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation

struct LeagueResponse : Decodable {
    
    var result : [League]?
    var success : Int
    
}
