//
//  SportsServicesProtocol.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 20/05/2025.
//

import Foundation

protocol SportsServicesProtocol {
     func getLeagues(sportType: String, completion: @escaping (LeagueResponse?) -> Void)
     func getLeagueDetails(sportType: String, leagueID: Int, completion: @escaping (EventResponse?) -> Void)
     func getLeagueTeams(sportType: String, leagueID: Int, completion: @escaping (TeamResponse?) -> Void)
     func getCricketLeagueDetails(leagueID: Int, completion: @escaping (CricketEventResponse?) -> Void)
     func getTenniseLeagueDetails(countryID: Int, completion: @escaping (TennisEventResponse?) -> Void)
}
