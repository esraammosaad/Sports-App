//
//  Tennis.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 16/05/2025.
//

import Foundation
import UIKit

class Tennis : SportProtocol{
    
    var upComingEvents : [TennisEvent]! = []
    var latestEvents : [TennisEvent]! = []
    var teams : [Team]! = []
    
    
    
    func getUpcomingEventsCount() -> Int {
        return upComingEvents.count
    }
    
    func getLatestEventsCount() -> Int {
        return latestEvents.count
    }
    
    func configureUpcomingEventCell(_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)

        cell.homeTeamName.text = upComingEvents[indexPath.row].event_first_player
        cell.awayTeamName.text = upComingEvents[indexPath.row].event_second_player
        cell.date.text = upComingEvents[indexPath.row].event_date
        cell.time.text = upComingEvents[indexPath.row].event_time
        cell.homeTeamImage.image = UIImage(named: "tennisP1")
        cell.awayTeamImage.image = UIImage(named: "tennisP2")
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

        cell.homeTeamName.text = latestEvents[indexPath.row].event_first_player
        cell.awayTeamName.text = latestEvents[indexPath.row].event_second_player
        cell.date.text = latestEvents[indexPath.row].event_date
        cell.finalScore.text = latestEvents[indexPath.row].event_final_result
        cell.homeTeamImage.image = UIImage(named: "tennisP1")
        cell.awayTeamImage.image = UIImage(named: "tennisP2")
    }
    
    func updateLeagueDetails(leagueDetails: [EventProtocol], collectionView: UICollectionView){
        if let event = leagueDetails as? [TennisEvent] {
            latestEvents = event.filter{ $0.event_status == "Finished" }
            upComingEvents = event.filter{ $0.event_status?.isEmpty ?? false || $0.event_status == nil }
            DispatchQueue.main.async {
                collectionView.reloadData()
            }
           
        }
    }
    
}
