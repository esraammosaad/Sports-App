//
//  FavoriteLeaguePresenterProtocol.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 20/05/2025.
//

import Foundation

protocol FavoriteLeaguePresenterProtocol{
    
    func setViewController (viewController : FavouritsViewController)
    func getAllFavourite()
    func deleteFavouriteLeague(saveLeague : SavedLeague)
    
}
