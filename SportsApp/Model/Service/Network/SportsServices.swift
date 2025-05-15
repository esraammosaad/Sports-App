//
//  APIService.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation
import Alamofire

class SportsServices{
    

    
    static func getLeagues (sportType : String, completion : @escaping (LeagueResponse?) -> Void){
        
    let url =  "\(Strings.BASEURL)\(sportType)/?APIkey=\(Strings.API_KEY)&met=\(Strings.LEAGUES_ENDPOINT)"
       AlamofireFactory.leagueRequest(url: url){
           leagueResponse in
               
           completion(leagueResponse)
           
           
       }
  
    }
    
    static func getLeagueDetails (sportType : String, leagueID : Int,completion : @escaping (EventResponse?) -> Void){
        
        
    let url =  "\(Strings.BASEURL)\(sportType)/?APIkey=\(Strings.API_KEY)&met=\(Strings.EVENTS_ENDPOINT)&from=2025-01-01&to=2025-06-30&leagueId=\(leagueID)"
        
        AlamofireFactory.leagueDetailsRequest(url: url){
            leagueDetailsResponse in
                
            completion(leagueDetailsResponse)
          
        }
        
  
    }
    
    static func getLeagueTeams (sportType : String, leagueID : Int ,completion : @escaping (TeamResponse?) -> Void){
    let url =  "\(Strings.BASEURL)\(sportType)/?APIkey=\(Strings.API_KEY)&met=\(Strings.TEAMS_ENDPOINT)&leagueId=\(leagueID)"
        
        AlamofireFactory.teamsRequest(url: url){
            teamsResponse in
            completion(teamsResponse)
        }
    }
    
    
}

