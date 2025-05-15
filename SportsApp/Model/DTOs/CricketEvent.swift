//
//  CricketEvent.swift
//  SportsApp
//
//  Created by Macos on 16/05/2025.
//

import Foundation
class CricketEvent : Decodable {
    
//    "event_key": 13826,
//                "event_date_start": "2024-07-18",
//                "event_date_stop": "2024-07-18",
//                "event_time": "12:00",
//                "event_home_team": "Oman",
//                "home_team_key": 100,
//                "event_away_team": "Namibia",
//                "away_team_key": 156,
//                "event_service_home": "",
//                "event_service_away": "47.5/50 ov, T:234",
//                "event_home_final_result": "233/8",
//                "event_away_final_result": "234/4",
//                "event_home_rr": "4.66",
//                "event_away_rr": "4.93",
//                "event_status": "Finished",
//                "event_status_info": "Namibia won by 6 wickets (with 13 balls remaining)",
//                "country_name": "Cricket",
//                "league_name": "ICC Men's Cricket World Cup League 2",
//                "league_key": 747,
//                "league_round": "14th Match",
//                "league_season": "2023-24-2027",
//                "event_live": "0",
//                "event_type": "ODI",
//                "event_toss": "Namibia, elected to bowl first",
//                "event_man_of_match": "Jan Frylinck",
//                "event_stadium": "Forthill, Dundee",
//                "event_home_team_logo": "https://apiv2.allsportsapi.com/logo-cricket/100_oman.jpg",
//                "event_away_team_logo": "https://apiv2.allsportsapi.com/logo-cricket/156_namibia.png",
    
    
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
