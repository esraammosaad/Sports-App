//
//  Event.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation

class Event{
    
    
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
    
    static func fromJson(response : [String : Any]) -> Event {
        
        let event = Event()
        event.event_key = response["event_key"] as? Int
        event.event_date = response["levent_date"] as? String
        event.event_time = response["event_time"] as? String
        event.event_home_team = response["event_home_team"] as? String
        event.event_away_team = response["event_away_team"] as? String
        event.event_halftime_result = response["event_halftime_result"] as? String
        event.event_final_result = response["event_final_result"] as? String
        event.event_ft_result = response["event_ft_result"] as? String
        event.event_penalty_result = response["event_penalty_result"] as? String
        event.event_status = response["event_status"] as? String
        event.country_name = response["country_name"] as? String
        event.league_name = response["league_name"] as? String
        event.home_team_logo = response["home_team_logo"] as? String
        event.away_team_logo = response["away_team_logo"] as? String
         
        return event
         
     }
    
    
  
}





