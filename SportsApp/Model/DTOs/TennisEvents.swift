//
//  TennisEvents.swift
//  SportsApp
//
//  Created by Macos on 16/05/2025.
//

import Foundation
class TennisEvent :Decodable {
    
//    "event_key": 12032968,
//                "event_date": "2025-05-12",
//                "event_time": "11:05",
//                "event_first_player": "Matos/ Melo",
//                "first_player_key": 59846,
//                "event_second_player": "Arends/ Johnson",
//                "second_player_key": 72179,
//                "event_final_result": "0 - 2",
//                "event_game_result": "-",
//                "event_serve": null,
//                "event_winner": "Second Player",
//                "event_status": "Finished",
//                "country_name": "Atp Doubles",
//                "league_name": "ATP Rome",
//                "league_key": 1270,
//                "league_round": "ATP Rome - 1/16-finals",
//                "league_season": "2025",
//                "event_live": "0",
//                "event_first_player_logo": null,
//                "event_second_player_logo": null,
//                "event_qualification": "False",
    
    var event_key :Int?
    var event_date : String?
    var event_time : String?
    var event_first_player :String?
    var event_second_player :String?
    var event_final_result :String?
    var event_status :String?
    
    
}

