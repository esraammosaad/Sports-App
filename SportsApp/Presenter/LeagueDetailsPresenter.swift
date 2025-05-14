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
  
}
