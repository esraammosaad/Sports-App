//
//  FavouriteLeaguePresenter.swift
//  SportsApp
//
//  Created by Macos on 17/05/2025.
//

import Foundation

class FavouriteLeaguePresenter {
    
    var viewController : FavouritsViewController!
    
    func setViewController (viewController : FavouritsViewController){
        self.viewController = viewController
    } 
    
    func getAllFavourite(){
        
       var favouriteLeagues = CoreDataUtils.shared.getFavouriteLeagues()
        viewController.getFavouriteLeagues(favouriteLeagues: favouriteLeagues)
    }
    
    
    
    
}
