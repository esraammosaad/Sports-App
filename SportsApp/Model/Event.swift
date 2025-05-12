//
//  Event.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation

struct Event : Decodable{
    
    
    var event_key : Int?
    var event_date : String?
    var event_time : String?
    var event_home_team : String?
    var event_away_team : String?
    var event_halftime_result : String?
    var event_final_result : String?
    var event_ft_result : String?
    var event_penalty_result : String?
    var event_status : String?
    var country_name : String?
    var league_name : String?
    var home_team_logo : String?
    var away_team_logo : String?
    
}





