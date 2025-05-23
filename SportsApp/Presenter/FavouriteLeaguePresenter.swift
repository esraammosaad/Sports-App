//
//  FavouriteLeaguePresenter.swift
//  SportsApp
//
//  Created by Macos on 17/05/2025.
//

import Foundation

class FavouriteLeaguePresenter : FavoriteLeaguePresenterProtocol {
    
    var viewController : FavouritsViewController!
    
    func setViewController (viewController : FavouritsViewController){
        self.viewController = viewController
    } 
    
    func getAllFavourite(){
        
        let favouriteLeagues = CoreDataUtils.shared.getFavouriteLeagues()
        viewController.getFavouriteLeagues(favouriteLeagues: favouriteLeagues)
    }
    
    
    func deleteFavouriteLeague(saveLeague : SavedLeague){
        CoreDataUtils.shared.deleteLeagueFromFavourits(savedLeague: saveLeague )
    }
    
    
    
    
}
