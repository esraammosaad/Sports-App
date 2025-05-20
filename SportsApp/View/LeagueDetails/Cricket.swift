//
//  Cricket.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 16/05/2025.
//

import Foundation
import UIKit

class Cricket : SportProtocol{
    
    var upComingEvents : [EventProtocol] = []
    var latestEvents : [EventProtocol] = []
    var teams : [Team] = []
    
    
    
    func getUpcomingEventsCount() -> Int {
        return upComingEvents.count
    }
    
    func getLatestEventsCount() -> Int {
        return latestEvents.count
    }
    
    func configureUpcomingEventCell(_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)
        if let upComingList = upComingEvents as? [CricketEvent]{
            cell.homeTeamName.text = upComingList[indexPath.row].event_home_team
            cell.awayTeamName.text = upComingList[indexPath.row].event_away_team
            cell.date.text = upComingList[indexPath.row].event_date_start
            cell.time.text = upComingList[indexPath.row].event_time
            let homeURL = URL(string: upComingList[indexPath.row].event_home_team_logo ?? "")
            let awayURL = URL(string: upComingList[indexPath.row].event_away_team_logo ?? "")
            cell.homeTeamImage.kf.setImage(with: homeURL)
            cell.awayTeamImage.kf.setImage(with: awayURL)
            
        }
    }
    

    
    func configureLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)
        
        if let latestList = latestEvents as? [CricketEvent]{
            
            cell.homeTeamName.text = latestList[indexPath.row].event_home_team
            cell.awayTeamName.text = latestList[indexPath.row].event_away_team
            cell.date.text = latestList[indexPath.row].event_date_start
            cell.finalScore.text = latestList[indexPath.row].event_away_final_result
            let homeURL = URL(string: latestList[indexPath.row].event_home_team_logo ?? "")
            let awayURL = URL(string: latestList[indexPath.row].event_away_team_logo ?? "")
            cell.homeTeamImage.kf.setImage(with: homeURL,placeholder: UIImage(named: "cricketTeam"))
            cell.awayTeamImage.kf.setImage(with: awayURL,placeholder: UIImage(named: "cricketTeam"))
        }
    }
    
    func updateLeagueDetails(leagueDetails: [EventProtocol], collectionView: UICollectionView){
        if let event = leagueDetails as? [CricketEvent] {
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
