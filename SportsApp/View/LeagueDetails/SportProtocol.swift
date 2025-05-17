//
//  SportProtocol.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 16/05/2025.
//

import Foundation
import UIKit
import ShimmerSwift

protocol SportProtocol{
    
    var upComingEvents: [EventProtocol] { get }
    var latestEvents: [EventProtocol] { get }
    var teams: [Team] { get }
    
    func getUpcomingEventsCount() -> Int
    func getLatestEventsCount() -> Int
    func configureUpcomingEventCell(_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath)
    func configureLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath)
    func updateLeagueDetails(leagueDetails: [EventProtocol], collectionView: UICollectionView)
    func getLeagueTeams(teams :[Team], collectionView: UICollectionView)
    
  
}

extension SportProtocol{
    func removeShimmer(cell : UICollectionViewCell){
        cell.contentView.subviews
            .filter { $0 is ShimmeringView }
            .forEach { $0.removeFromSuperview() }
    }
    func configureTeamCell(_ cell: TeamSectionCollectionViewCell, at indexPath: IndexPath, imageName : String) {
        removeShimmer(cell: cell)
        let placeholderImage: UIImage?
        placeholderImage = UIImage(named: imageName)
        cell.teamImage.kf.setImage(with: URL(string: teams[indexPath.row].team_logo ?? ""), placeholder: placeholderImage)
        cell.teamName.text = teams[indexPath.row].team_name
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
    }
}


