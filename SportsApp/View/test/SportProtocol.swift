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
    

    func getUpcomingEventsCount() -> Int
    func getLatestEventsCount() -> Int
    func configureUpcomingEventCell(_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath)
    func configureTeamCell(_ cell: TeamSectionCollectionViewCell, at indexPath: IndexPath)
    func configureLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath)
    func updateLeagueDetails(leagueDetails: [EventProtocol], collectionView: UICollectionView)
  
}

extension SportProtocol{
    func removeShimmer(cell : UICollectionViewCell){
        cell.contentView.subviews
            .filter { $0 is ShimmeringView }
            .forEach { $0.removeFromSuperview() }
    }
}


