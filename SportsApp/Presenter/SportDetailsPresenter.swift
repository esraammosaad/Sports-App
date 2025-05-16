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
    
    
    func getSportDetails(sportType : String){
        
        SportsServices.getLeagues(sportType: sportType){
            leaguesResponse in
            if let leagues = leaguesResponse?.result{
                self.sportDetailsViewController.updateLeagues(leagues: leagues)
            }
        }
    }
    
    
}
