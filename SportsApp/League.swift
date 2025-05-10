//
//  League.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation

class League{
    
    var league_key : Int?
    var league_name : String?
    var country_key : Int?
    var country_name : String?
    var league_logo : String?
    
    
   static func fromJson(response : [String : Any]) -> League {
       
       var league = League()
        
        league.league_key = response["league_key"] as? Int
       league.league_name = response["league_name"] as? String
       league.country_key = response["country_key"] as? Int
       league.country_name = response["country_name"] as? String
       league.league_logo = response["league_logo"] as? String
        
        
        return league
        
    }
    
}


