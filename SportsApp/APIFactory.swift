//
//  APIService.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation
import Alamofire

class APIFactory{
    func  execute (url : String, completion : @escaping ([String : Any]? ,Error?) -> Void){
        AF.request(url).validate(statusCode: 200..<300).responseJSON{
            response in
            switch response.result{
            case .failure(let error):
                completion(nil , error)
                
            
            case .success(let successResponse):
                completion(successResponse as? [String : Any] , nil)
                
            
            }
        }
    }
}

class APIServices{
    
    let apiFactory = APIFactory()
    
    let url =  "\(Strings.BASEURL)\(Strings.FOOTBALL_ENDPOINT)/?APIkey=\(Strings.API_KEY)"
    
    
    func getFootballLeagues(completion : @escaping ([String : Any]?, Error?)-> Void){
        
        
       apiFactory.execute(url: url.appending("&met=\(Strings.LEAGUES_ENDPOINT)"),completion: completion)
    }
    
    
    func getFootballLeagueDetails(){
        
        
        
        
    }
    
    func getFootballTeamDetails(){
        
        
        
        
        
    }
    
    
    
}
