//
//  Tennis.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 16/05/2025.
//

import Foundation
import UIKit

class Tennis : SportProtocol{
    
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
        if let upComingList = upComingEvents as? [TennisEvent]{
            removeShimmer(cell: cell)
            cell.homeTeamName.text = upComingList[indexPath.row].event_first_player
            cell.awayTeamName.text = upComingList[indexPath.row].event_second_player
            cell.date.text = upComingList[indexPath.row].event_date
            cell.time.text = upComingList[indexPath.row].event_time
            cell.homeTeamImage.image = UIImage(named: "tennisP1")
            cell.awayTeamImage.image = UIImage(named: "tennisP2")
            
        }
    }
    

    
    func configureLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath) {
        removeShimmer(cell: cell)
        if let latestList = latestEvents as? [TennisEvent]{
            cell.homeTeamName.text = latestList[indexPath.row].event_first_player
            cell.awayTeamName.text = latestList[indexPath.row].event_second_player
            cell.date.text = latestList[indexPath.row].event_date
            cell.finalScore.text = latestList[indexPath.row].event_final_result
            cell.homeTeamImage.image = UIImage(named: "tennisP1")
            cell.awayTeamImage.image = UIImage(named: "tennisP2")
            
        }
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
    func getLeagueTeams(teams :[Team],collectionView : UICollectionView){
      
        DispatchQueue.main.async {
            self.teams = teams
            collectionView.reloadData()
        }
    }
    
}
