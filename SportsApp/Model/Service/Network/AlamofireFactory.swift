//
//  AlamofireFactory.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 13/05/2025.
//

import Foundation
import Alamofire

class AlamofireFactory{
    
    
    static func leagueRequest(url : String, completion : @escaping (LeagueResponse?) -> Void){
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
    
    static func leagueDetailsRequest(url : String, completion : @escaping (EventResponse?) -> Void){
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
    
    static func teamsRequest(url : String, completion : @escaping (TeamResponse?) -> Void){
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
    
    
//https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=edaabe5e8bfd4f780d114f7cafd181e0acc496f308f7685089b5cd9ecf224f5d&countryId=267
    
    static func tennisLeagueDetails(url : String, completion : @escaping (TeamResponse?) -> Void){
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
