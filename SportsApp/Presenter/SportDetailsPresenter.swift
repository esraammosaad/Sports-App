//
//  SportDetailsPresenter.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 12/05/2025.
//

import Foundation

class SportDetailsPresenter : SportsDetailsPresenterProtocol{
    
    
    var sportDetailsViewController : SportDetailsViewProtocol!
    var sportsServices : SportsServicesProtocol = SportsServices()
    
    func setViewController(sportDetailsVireController : SportDetailsViewProtocol){
        
        self.sportDetailsViewController = sportDetailsVireController
        
    }
    
    
    func getSportDetails(sportType : String){
        
        sportsServices.getLeagues(sportType: sportType){
            leaguesResponse in
            if let leagues = leaguesResponse?.result{
                self.sportDetailsViewController.updateLeagues(leagues: leagues)
            }
        }
    }
    
    
}
