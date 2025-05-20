//
//  LeagueDetailsPresenterProtocol.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 20/05/2025.
//

import Foundation

protocol LeagueDetailsPresenterProtocol{
    
    func setViewController(leagueDetailsViewController : LeagueDetailsViewProtocol)
    func getLeagueDetails(sportType : String, leagueID : Int)
    func getLeagueTeams(sportType : String, leagueID : Int)
    func getCricketLeagueDetails (leagueId:Int)
    func getTnnisEvents (countryId:Int)
    func setFavouriteLeague(SavedLeague : SavedLeague)
    func deleteFavouriteLeague (savedLeague :SavedLeague)
    func isFavorite (leagueName :String) -> Bool
  
}
