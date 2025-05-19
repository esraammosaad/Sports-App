//
//  TeamDetailsPresenter.swift
//  SportsApp
//
//  Created by Macos on 19/05/2025.
//

import Foundation

class TeamDetailsPresenter {
    
    var teamDetailsCollectionViewController : TeamDetailsCollectionViewController!
    
    func setViewController (teamDetailsCollectionViewController : TeamDetailsCollectionViewController){
        self.teamDetailsCollectionViewController = teamDetailsCollectionViewController
    }
    
    func getTeamDetails(leagueTitle :String){
        SportsServices.getTeamsDEtails(leagueTitle: leagueTitle){
            team in
            if let team = team?.result{
                self.teamDetailsCollectionViewController.getTeamsDetails(teamsDetails: team)
            }
        }
        
    }
}

