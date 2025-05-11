//
//  APIServices.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation
class APIServices{
    
    let apiFactory = APIFactory()
    let url =  "\(Strings.BASEURL)\(Strings.FOOTBALL_ENDPOINT)/?APIkey=\(Strings.API_KEY)"
    
    func getFootballLeagues(completion : @escaping ([String : Any]?, Error?)-> Void){
      
        
        
       apiFactory.execute(url: url + "&met=\(Strings.LEAGUES_ENDPOINT)",completion: completion)
    }
    
    
    func getFootballLeagueEvents(leagueID : Int,completion : @escaping ([String : Any]?, Error?)-> Void){
        
        apiFactory.execute(url: "\(url)&met=\(Strings.EVENTS_ENDPOINT)&from=2024-05-01&to=2024-05-18&leagueId=\(leagueID)",completion: completion)
        
     }
    
    func getFootballLeagueDetails(completion : @escaping ([String : Any]?, Error?)-> Void){

        apiFactory.execute(url: url + "&met=\(Strings.TEAMS_ENDPOINT)",completion: completion)
     }
    
    func getFootballTeamDetails(){
        
        
        
        
        
    }
    
    
    
}

