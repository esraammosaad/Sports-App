//
//  Cricket.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 16/05/2025.
//

import Foundation
import UIKit

class Cricket : SportProtocol{
    
    var upComingEvents : [CricketEvent]! = []
    var latestEvents : [CricketEvent]! = []
    var teams : [Team]! = []
    
    
    
    func getUpcomingEventsCount() -> Int {
        return upComingEvents.count
    }
    
    func getLatestEventsCount() -> Int {
        return latestEvents.count
    }
    
    func configureUpcomingEventCell(_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)

        cell.homeTeamName.text = upComingEvents[indexPath.row].event_home_team
        cell.awayTeamName.text = upComingEvents[indexPath.row].event_away_team
        cell.date.text = upComingEvents[indexPath.row].event_date_start
        cell.time.text = upComingEvents[indexPath.row].event_time
        let homeURL = URL(string: upComingEvents[indexPath.row].event_home_team_logo ?? "")
        let awayURL = URL(string: upComingEvents[indexPath.row].event_away_team_logo ?? "")
        cell.homeTeamImage.kf.setImage(with: homeURL)
        cell.awayTeamImage.kf.setImage(with: awayURL)
    }
    
    func configureTeamCell(_ cell: TeamSectionCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)

        let placeholderImage: UIImage?
        placeholderImage = UIImage(named: "footballTeam")
        cell.teamImage.kf.setImage(with: URL(string: teams[indexPath.row].team_logo ?? ""), placeholder: placeholderImage)
        cell.teamName.text = teams[indexPath.row].team_name
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
    }
    
    func configureLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)

        cell.homeTeamName.text = latestEvents[indexPath.row].event_home_team
        cell.awayTeamName.text = latestEvents[indexPath.row].event_away_team
        cell.date.text = latestEvents[indexPath.row].event_date_start
        cell.finalScore.text = latestEvents[indexPath.row].event_away_final_result
        let homeURL = URL(string: latestEvents[indexPath.row].event_home_team_logo ?? "")
        let awayURL = URL(string: latestEvents[indexPath.row].event_away_team_logo ?? "")
        cell.homeTeamImage.kf.setImage(with: homeURL,placeholder: UIImage(named: "cricketTeam"))
        cell.awayTeamImage.kf.setImage(with: awayURL,placeholder: UIImage(named: "cricketTeam"))
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
    
}
