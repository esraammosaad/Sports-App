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
    
    
    func getSportDetails(leagueID : Int){
        
        if(self.leagueDetailsViewController.category == 0){
            NetworkService.getFootballLeagueDetails(leagueID: leagueID  ){
                leagueDetailsResponse in
                if let leagueDetails = leagueDetailsResponse?.result {
                    self.leagueDetailsViewController.updateLeagueDetails(leagueDetails: leagueDetails)
                    print(leagueDetails)
                    print(leagueID)
                }
            }
        }else if(self.leagueDetailsViewController.category == 1){
            NetworkService.getBasketballLeagueDetails(leagueID: leagueID){
                leagueDetailsResponse in
                if let leagueDetails = leagueDetailsResponse?.result {
                    self.leagueDetailsViewController.updateLeagueDetails(leagueDetails: leagueDetails)
                    print(leagueDetails)
                    print(leagueID)
                }
            }
            
        }else if(self.leagueDetailsViewController.category == 2){
            
        }else{
            
            
        }
   
    }
    
    
    
    
    
    
    
    
    
    
}
