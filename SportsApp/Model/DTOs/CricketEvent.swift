//
//  CricketEvent.swift
//  SportsApp
//
//  Created by Macos on 16/05/2025.
//

import Foundation
struct CricketEvent : Decodable, EventProtocol {

    var event_key : Int?
    var event_date_start : String?
    var event_time : String?
    var event_home_team : String?
    var event_away_team : String?
    var event_away_final_result : String?
    var event_status : String?
    var country_name : String?
    var league_name : String?
    var event_home_team_logo : String?
    var event_away_team_logo : String?
}
