//
//  SportDetailsPresenter.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 12/05/2025.
//

import Foundation

class SportDetailsPresenter{
    
    
    var sportDetailsViewController : SportDetailsViewProtocol!
    
    func setViewController(sportDetailsVireController : SportDetailsViewProtocol){
        
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
    
    func getAllFavourite(){
        var favourites = CoreDataUtils.shared.getFavouriteLeagues()
        sportDetailsViewController.getFavouriteLEagues(favouriteLEagues: favourites)
        
    }
    
}
