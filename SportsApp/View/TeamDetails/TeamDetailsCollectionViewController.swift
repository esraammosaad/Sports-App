//
//  TeamDetailsCollectionViewController.swift
//  SportsApp
//
//  Created by Macos on 18/05/2025.
//

import UIKit
import Kingfisher
import ShimmerSwift

private let reuseIdentifier = "favCellOne"

class TeamDetailsCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
 
    var teamDetailsItem : Team!
    var placeHolder : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib1 = UINib(nibName: "TeamLogo", bundle: nil)
        self.collectionView!.register(nib1, forCellWithReuseIdentifier: "TeamLogo")
        
        
       
        let nib3 = UINib(nibName: "TeamSectionCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib3, forCellWithReuseIdentifier: Strings.TEAM_CELL_IDENTIFIER)
        let headerNib = UINib(nibName: "LeagueDetailsHeaderCollectionReusableView", bundle: nil)
        collectionView.register(headerNib,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "header")

    }
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1 :
            return teamDetailsItem.players == nil ? 10 : teamDetailsItem.players!.count
        default :
            return 1
            
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0 :
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamLogo", for: indexPath) as! TeamLogo
                cell.teamLogo.kf.setImage(
                    with: URL(string: teamDetailsItem.team_logo ?? ""),
                    placeholder: UIImage(named: placeHolder)
                )
                return cell
        default :
            if (teamDetailsItem.players == nil ){
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerDetails", for: indexPath) as! PlayerDetails
                let shimmer = ShimmeringView(frame: cell.contentView.bounds)
                shimmer.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                shimmer.isShimmering = true
                
                let loadingView = UIView(frame: shimmer.bounds)
                loadingView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
                loadingView.layer.cornerRadius = 25
                shimmer.contentView = loadingView
                cell.playerImage.image = nil
                cell.playerRole.text = ""
                cell.playerName.text = ""

                cell.contentView.addSubview(shimmer)
                
                return cell
            }
            else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerDetails", for: indexPath) as! PlayerDetails

                   cell.playerImage.kf.setImage(
                    with: URL(string: teamDetailsItem.players![indexPath.row].player_image ?? ""),
                       placeholder: UIImage(named: "footballPlayer")
                   )
                cell.playerName.text = teamDetailsItem.players![indexPath.row].player_name
                cell.playerRole.text = teamDetailsItem.players![indexPath.row].player_type
                   return cell
            }

        }
    }
    
    func getTeamsDetails(teamsDetails: [Team]){
        
        self.teamDetailsItem = teamsDetails[0]
        
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! LeagueDetailsHeaderCollectionReusableView
            
            switch(indexPath.section){
            case 0 :
                headerView.headerLabel.text = teamDetailsItem.team_name
              default:
                headerView.headerLabel.text = "\(teamDetailsItem.team_name!)'s Players"
            }
            return headerView
        }
        return UICollectionReusableView()
    }


    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

    // Footer height
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 50)
//    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero  // or UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }



    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
