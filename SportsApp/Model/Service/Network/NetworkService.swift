//
//  APIService.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation
import Alamofire

class NetworkService{
    

    
   static func getFootballLeagues (completion : @escaping (LeagueResponse?) -> Void){
    let url =  "\(Strings.BASEURL)\(Strings.FOOTBALL_ENDPOINT)/?APIkey=\(Strings.API_KEY)&met=\(Strings.LEAGUES_ENDPOINT)"
        AF.request(url).validate(statusCode: 200..<300).responseDecodable(of:LeagueResponse.self){
            response in
            switch response.result{
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            case .success(let successResponse):
                completion(successResponse)
            }
        }
    }
    
    static func getFootballLeagueDetails (leagueID : Int,completion : @escaping (EventResponse?) -> Void){
    let url =  "\(Strings.BASEURL)\(Strings.FOOTBALL_ENDPOINT)/?APIkey=\(Strings.API_KEY)&met=\(Strings.EVENTS_ENDPOINT)&from=2025-05-01&to=2025-05-30&leagueId=\(leagueID)"
        
        AF.request(url).validate(statusCode: 200..<300).responseDecodable(of:EventResponse.self){
            response in
            switch response.result{
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            case .success(let successResponse):
                completion(successResponse)
            }
        }
    }
    
    static func getFootballLeagueTeams (leagueID : Int ,completion : @escaping (TeamResponse?) -> Void){
    let url =  "\(Strings.BASEURL)\(Strings.FOOTBALL_ENDPOINT)/?APIkey=\(Strings.API_KEY)&met=\(Strings.TEAMS_ENDPOINT)&leagueId=\(leagueID)"
        AF.request(url).validate(statusCode: 200..<300).responseDecodable(of:TeamResponse.self){
            response in
            switch response.result{
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            case .success(let successResponse):
                completion(successResponse)
            }
        }
    }
}

