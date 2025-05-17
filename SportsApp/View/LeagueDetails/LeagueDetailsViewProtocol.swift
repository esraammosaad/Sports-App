//
//  ViewProtocol.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 17/05/2025.
//

import Foundation

protocol LeagueDetailsViewProtocol{
    
    func updateLeagueDetails(leagueDetails: [Event])
    func getLeagueTeams(teams :[Team])
    func updateCricketDetails (cricketEvents :[CricketEvent])
    func getTennisEvents (tennisEvents :[TennisEvent])
    
}
