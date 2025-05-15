//
//  LeagueDetailsPresenter.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 12/05/2025.
//

import Foundation

class LeagueDetailsPresenter{
    
    
    var leagueDetailsViewController : LeagueDetailsCollectionViewController!
    
    func setViewController(leagueDetailsViewController : LeagueDetailsCollectionViewController){

        self.leagueDetailsViewController = leagueDetailsViewController
 
    }
    
    
    func getLeagueDetails(sportType : String, leagueID : Int){

        SportsServices.getLeagueDetails(sportType: sportType, leagueID: leagueID  ){
            leagueDetailsResponse in
            if let leagueDetails = leagueDetailsResponse?.result {
                self.leagueDetailsViewController.updateLeagueDetails(leagueDetails: leagueDetails)
                print(leagueDetails)
                print(leagueID)
            }
        }
        
    }
    func getLeagueTeams(sportType : String, leagueID : Int){

        SportsServices.getLeagueTeams(sportType: sportType, leagueID: leagueID  ){
            leagueTeams in
            if let teams = leagueTeams?.result {
                self.leagueDetailsViewController.getLeagueTeams(teams: teams)
               
            }
        }
        
    }
    func getCricketLeagueDetails (){
        SportsServices.getCricketLeagueDetails{
            cricketEvents in
            if let cricketEvents = cricketEvents?.result {
                self.leagueDetailsViewController.udateCricketDetails(cricketEvents: cricketEvents)
            }
        }
    }
  
}
