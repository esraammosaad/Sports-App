//
//  Team.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 11/05/2025.
//

import Foundation

struct Team : Decodable{
    
    var team_key: Int?
    var team_name: String?
    var team_logo: String?
    var players: [Player]?
    var coaches: [Coach]?

    
    
}

