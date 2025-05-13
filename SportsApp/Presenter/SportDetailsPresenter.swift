//
//  SportDetailsPresenter.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 12/05/2025.
//

import Foundation

class SportDetailsPresenter{
    
    
    var sportDetailsViewController : SportDetailsViewController!
    
    func setViewController(sportDetailsVireController : SportDetailsViewController){
        
        self.sportDetailsViewController = sportDetailsVireController
        
    }
    
    
    func getSportDetails(){
        
        if(self.sportDetailsViewController.category == 0){
            NetworkService.getFootballLeagues(){
                leaguesResponse in
                if let leagues = leaguesResponse?.result{
                    self.sportDetailsViewController.updateLeagues(leagues: leagues)
                }
            }
        }else if(self.sportDetailsViewController.category == 1){
            NetworkService.getBasketballLeagues{
                leaguesResponse in
                if let leagues = leaguesResponse?.result{
                    self.sportDetailsViewController.updateLeagues(leagues: leagues)
                }
            }
        }else if(self.sportDetailsViewController.category == 2){
            
            
        }else{
            
            
        }

        
          
    }
    
}
