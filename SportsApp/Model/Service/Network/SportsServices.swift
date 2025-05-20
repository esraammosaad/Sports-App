//
//  APIService.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation
import Alamofire

class SportsServices : SportsServicesProtocol{
    

    
    func getLeagues (sportType : String, completion : @escaping (LeagueResponse?) -> Void){
        
    let url =  "\(Strings.BASEURL)\(sportType)/?APIkey=\(Strings.API_KEY)&met=\(Strings.LEAGUES_ENDPOINT)"
       AlamofireFactory.leagueRequest(url: url){
           leagueResponse in
           completion(leagueResponse)
       }
    }
    
    func getLeagueDetails (sportType : String, leagueID : Int,completion : @escaping (EventResponse?) -> Void){
     
    let url =  "\(Strings.BASEURL)\(sportType)/?APIkey=\(Strings.API_KEY)&met=\(Strings.EVENTS_ENDPOINT)&from=2025-05-01&to=2025-07-30&leagueId=\(leagueID)"
        
        AlamofireFactory.leagueDetailsRequest(url: url){
            leagueDetailsResponse in
                
            completion(leagueDetailsResponse)
          
        }
        
  
    }
    
     func getLeagueTeams (sportType : String, leagueID : Int ,completion : @escaping (TeamResponse?) -> Void){
    let url =  "\(Strings.BASEURL)\(sportType)/?APIkey=\(Strings.API_KEY)&met=\(Strings.TEAMS_ENDPOINT)&leagueId=\(leagueID)"
        
        AlamofireFactory.teamsRequest(url: url){
            teamsResponse in
            completion(teamsResponse)
        }
    }
    
     func getCricketLeagueDetails (leagueID : Int,completion : @escaping (CricketEventResponse?) -> Void){
        let url = "\(Strings.BASEURL)\(Strings.CRICKET_ENDPOINT)/?met=\(Strings.EVENTS_ENDPOINT)&APIkey=\(Strings.API_KEY)&from=2025-05-01&to=2025-07-30&leagueId=\(leagueID)"
        
        AlamofireFactory.getCricketLeagueDetails(url: url){
            cricketTeamResponse in
            completion(cricketTeamResponse)
        }
    }
     func getTenniseLeagueDetails (countryID : Int,completion : @escaping (TennisEventResponse?) -> Void){
        let url = "\(Strings.BASEURL)\(Strings.TENNIS_ENDPOINT)/?met=\(Strings.EVENTS_ENDPOINT)&APIkey=\(Strings.API_KEY)&from=2025-05-01&to=2025-07-30&countryId=\(countryID)"
        
        AlamofireFactory.getTennisLeagueDetails(url: url){
            tennisEventResponse in
            completion(tennisEventResponse)
        }
    }
}

