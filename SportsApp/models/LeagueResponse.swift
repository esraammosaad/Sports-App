//
//  LeagueResponse.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation

class LeagueResponse{
    
    var result : [[String : Any]]?
    var success : Int?
    
    static func fromJson(response : [String : Any]) -> [League]{
        let leagueResponse = LeagueResponse()
        var leagueList : [League] = []
        leagueResponse.result = response["result"] as? [[String : Any]]
        leagueResponse.success = response["sucess"] as? Int

        for i in leagueResponse.result! {
            leagueList.append(League.fromJson(response: i))
        }
       return leagueList
    }
}
