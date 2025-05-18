//
//  LeagueDetailsPresenter.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 12/05/2025.
//

import Foundation

class LeagueDetailsPresenter{
    
    
    var leagueDetailsViewController : LeagueDetailsViewProtocol!
    
    func setViewController(leagueDetailsViewController : LeagueDetailsViewProtocol){

        self.leagueDetailsViewController = leagueDetailsViewController
 
    }
    
    
    func getLeagueDetails(sportType : String, leagueID : Int){

        SportsServices.getLeagueDetails(sportType: sportType, leagueID: leagueID  ){
            leagueDetailsResponse in
            if let leagueDetails = leagueDetailsResponse?.result {
                self.leagueDetailsViewController.updateLeagueDetails(leagueDetails: leagueDetails)
              
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
    func getCricketLeagueDetails (leagueId:Int){
        SportsServices.getCricketLeagueDetails(leagueID: leagueId){
            cricketEvents in
            if let cricketEvents = cricketEvents?.result {
                self.leagueDetailsViewController.updateCricketDetails(cricketEvents: cricketEvents)
            }
        }
    }
    func getTnnisEvents (countryId:Int){
        SportsServices.getTenniseDetails(countryID: countryId){
            tennisEvents in
            if let tennisEvents = tennisEvents?.result{
                self.leagueDetailsViewController.getTennisEvents(tennisEvents: tennisEvents)
            }
        }
    }
    
    func setFavouriteLeague(SavedLeague : SavedLeague){
        
        CoreDataUtils.shared.setFavouriteLeague(savedLeague: SavedLeague)
    }
    func deleteFavouriteLeague (savedLeague :SavedLeague){
        CoreDataUtils.shared.deleteLeagueFromFavourits(savedLeague: savedLeague)
    }
  
}
