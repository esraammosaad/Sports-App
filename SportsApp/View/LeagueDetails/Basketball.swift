//
//  Basketball.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 16/05/2025.
//

import Foundation
import UIKit

class Basketball : SportProtocol{
    var upComingEvents : [EventProtocol] = []
    var latestEvents : [EventProtocol] = []
    var teams : [Team] = []
    
    
    func configureUpcomingEventCell(_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)
        if let upComingList = upComingEvents as? [Event]{
            cell.homeTeamName.text = upComingList[indexPath.row].event_home_team
            cell.awayTeamName.text = upComingList[indexPath.row].event_away_team
            cell.date.text = upComingList[indexPath.row].event_date
            cell.time.text = upComingList[indexPath.row].event_time
            let homeURL = URL(string: upComingList[indexPath.row].home_team_logo ?? "")
            let awayURL = URL(string: upComingList[indexPath.row].away_team_logo ?? "")
            cell.homeTeamImage.kf.setImage(with: homeURL)
            cell.awayTeamImage.kf.setImage(with: awayURL)
        }
    }
    

    
    func configureLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)
        if let latestList = latestEvents as? [Event]{
            cell.homeTeamName.text = latestList[indexPath.row].event_home_team
            cell.awayTeamName.text = latestList[indexPath.row].event_away_team
            cell.date.text = latestList[indexPath.row].event_date
            cell.time.text = latestList[indexPath.row].event_time
            cell.finalScore.text = latestList[indexPath.row].event_final_result
            let homeURL = URL(string: latestList[indexPath.row].home_team_logo ?? "")
            let awayURL = URL(string: latestList[indexPath.row].away_team_logo ?? "")
            cell.homeTeamImage.kf.setImage(with: homeURL)
            cell.awayTeamImage.kf.setImage(with: awayURL)
            
        }
    }
    
    func updateLeagueDetails(leagueDetails: [EventProtocol], collectionView: UICollectionView){
        if let event = leagueDetails as? [Event] {
            latestEvents = event.filter{ $0.event_status == "Finished" }
            upComingEvents = event.filter{ $0.event_status?.isEmpty ?? false || $0.event_status == nil }
            DispatchQueue.main.async {
                collectionView.reloadData()
            }
           
        }
    }
    
    func getLeagueTeams(teams :[Team],collectionView : UICollectionView){
      
        DispatchQueue.main.async {
            self.teams = teams
            collectionView.reloadData()
        }
    }
      
}
