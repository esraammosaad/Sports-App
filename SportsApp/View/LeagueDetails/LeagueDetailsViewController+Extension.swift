//
//  LeagueDetailsViewController+Extension.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 19/05/2025.
//

import Foundation
import UIKit
import ShimmerSwift

extension LeagueDetailsCollectionViewController{
    
    //Draw Sections & Headers
    
    func drawSection() -> NSCollectionLayoutSection{
        //item size
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        // item >> size
        let item = NSCollectionLayoutItem(layoutSize: bigItemSize)
        
        //groupsize
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        
        //group >> size , item
        let myGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        myGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        //section >> group
        let section = NSCollectionLayoutSection(group: myGroup)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
        
        self.setHeaderForSection(section: section)
        self.setAnimationToSection(section: section)
        
        
        
        return section
    }
    
    func drawSectionVertical() -> NSCollectionLayoutSection{
        //item size
        
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        // item >> size
        let item = NSCollectionLayoutItem(layoutSize: bigItemSize)
        
        
        //groupsize
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
        
        //group >> size , item
        let myGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        myGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
        
        //section >> group
        let section = NSCollectionLayoutSection(group: myGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 14, bottom: 0, trailing: 14)

        self.setHeaderForSection(section: section)
        self.setAnimationToSection(section: section)
        
        return section
    }
    
    
    func drawTeamSection()->NSCollectionLayoutSection{
        //item size
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        // item >> size
        let item = NSCollectionLayoutItem(layoutSize: bigItemSize)
        
        //groupsize
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(110))
        
        //group >> size , item
        let myGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        myGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2)
        
        //section >> group
        let section = NSCollectionLayoutSection(group: myGroup)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 5, bottom: 8, trailing: 5)
        
        self.setHeaderForSection(section: section)
       // self.setAnimationToSection(section: section)

        return section
    }
    
    
    func setHeaderForSection(section : NSCollectionLayoutSection){
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(60)
                ),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        
    }
    
    func setAnimationToSection(section : NSCollectionLayoutSection){
        
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.section == 1 ){
            let vc = storyboard?.instantiateViewController(withIdentifier: "teamDetailsd") as! TeamDetailsCollectionViewController
            vc.teamDetailsItem = currentSport.teams[indexPath.row]
            vc.placeHolder = teameLogoPlaceholder
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
    }
    
    func setupShimmer(_ cell: UICollectionViewCell) {
        let shimmer = ShimmeringView(frame: cell.contentView.bounds)
        shimmer.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        shimmer.isShimmering = true
        
        let loadingView = UIView(frame: shimmer.bounds)
        loadingView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        loadingView.layer.cornerRadius = 15
        shimmer.contentView = loadingView

        cell.contentView.addSubview(shimmer)
    }

    
}



