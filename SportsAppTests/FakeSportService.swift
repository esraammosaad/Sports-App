//
//  FakeSportService.swift
//  SportsAppTests
//
//  Created by Macos on 20/05/2025.
//

import XCTest
@testable import SportsApp

class FakeSportsServices  {
    var shouldReturnError: Bool

    init(shouldReturnError: Bool = false) {
        self.shouldReturnError = shouldReturnError
    }
  
     func getLeagues(sportType: String, completion: @escaping (LeagueResponse?) -> Void) {
        if shouldReturnError
             {
            completion(nil)
             }else{
                 let response = LeagueResponse(result: [], success: 1)
                  completion(response)
             }
    }
    

     func getLeagueDetails(sportType: String, leagueID: Int, completion: @escaping (EventResponse?) -> Void) {
         if shouldReturnError
              {
             completion(nil)
              }else{
                  let eventResponse = EventResponse(result: [], success: 1)
                  completion(eventResponse)
              }
    }

     func getLeagueTeams(sportType: String, leagueID: Int, completion: @escaping (TeamResponse?) -> Void) {
         if shouldReturnError
              {
             completion(nil)
              }else{
                  let teamResponse = TeamResponse(result: [], success: 1)
                  completion(teamResponse)
              }
    }
//
//     func getCricketLeagueDetails(leagueID: Int, completion: @escaping (CricketEventResponse?) -> Void) {
//        completion(fakeCricketEventResponse)
//    }
//
//     func getTenniseDetails(countryID: Int, completion: @escaping (TennisEventResponse?) -> Void) {
//        completion(fakeTennisEventResponse)
//    }
}
