//
//  APIService.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation
import Alamofire
protocol SportsServicesProtocol {
    static func getLeagues(sportType: String, completion: @escaping (LeagueResponse?) -> Void)
    static func getLeagueDetails(sportType: String, leagueID: Int, completion: @escaping (EventResponse?) -> Void)
    static func getLeagueTeams(sportType: String, leagueID: Int, completion: @escaping (TeamResponse?) -> Void)
    static func getCricketLeagueDetails(leagueID: Int, completion: @escaping (CricketEventResponse?) -> Void)
    static func getTenniseDetails(countryID: Int, completion: @escaping (TennisEventResponse?) -> Void)
}

class SportsServices : SportsServicesProtocol{
    

    
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
    
    static func getCricketLeagueDetails (leagueID : Int,completion : @escaping (CricketEventResponse?) -> Void){
        let url = "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=edaabe5e8bfd4f780d114f7cafd181e0acc496f308f7685089b5cd9ecf224f5d&from=2024-03-13&to=2025-05-17&leagueId=\(leagueID)"
        
        AlamofireFactory.getCricketLeagueDetails(url: url){
            cricketTeamResponse in
            completion(cricketTeamResponse)
        }
    }
    static func getTenniseDetails (countryID : Int,completion : @escaping (TennisEventResponse?) -> Void){
        let url = "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=edaabe5e8bfd4f780d114f7cafd181e0acc496f308f7685089b5cd9ecf224f5d&from=2025-05-9&to=2025-05-18&countryId=\(countryID)"
        
        AlamofireFactory.getTennisDetails(url: url){
            tennisEventResponse in
            completion(tennisEventResponse)
        }
    }
    
    
}

