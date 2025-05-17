//
//  Basketball.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 16/05/2025.
//

import Foundation
import UIKit

class Basketball : SportProtocol{
    var upComingEvents : [Event]! = []
    var latestEvents : [Event]! = []
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
        cell.date.text = upComingEvents[indexPath.row].event_date
        cell.time.text = upComingEvents[indexPath.row].event_time
        let homeURL = URL(string: upComingEvents[indexPath.row].home_team_logo ?? "")
        let awayURL = URL(string: upComingEvents[indexPath.row].away_team_logo ?? "")
        cell.homeTeamImage.kf.setImage(with: homeURL)
        cell.awayTeamImage.kf.setImage(with: awayURL)
    }
    
    func configureTeamCell(_ cell: TeamSectionCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)

        let placeholderImage: UIImage? = UIImage(named: "baskteballTeam")
        cell.teamImage.kf.setImage(with: URL(string: teams[indexPath.row].team_logo ?? ""), placeholder: placeholderImage)
        cell.teamName.text = teams[indexPath.row].team_name
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
    }
    
    func configureLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)

        cell.homeTeamName.text = latestEvents[indexPath.row].event_home_team
        cell.awayTeamName.text = latestEvents[indexPath.row].event_away_team
        cell.date.text = latestEvents[indexPath.row].event_date
        cell.finalScore.text = latestEvents[indexPath.row].event_final_result
        let homeURL = URL(string: latestEvents[indexPath.row].home_team_logo ?? "")
        let awayURL = URL(string: latestEvents[indexPath.row].away_team_logo ?? "")
        cell.homeTeamImage.kf.setImage(with: homeURL)
        cell.awayTeamImage.kf.setImage(with: awayURL)
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
      
}
