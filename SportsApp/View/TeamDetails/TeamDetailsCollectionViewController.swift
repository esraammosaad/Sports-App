//
//  TeamDetailsCollectionViewController.swift
//  SportsApp
//
//  Created by Macos on 18/05/2025.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "favCellOne"

class TeamDetailsCollectionViewController: UICollectionViewController {
    
    //    var players : [Players] = []
    var teamDetailsItem : Team!
    var placeHolder : String!
    //    var Presenter : TeamDetailsPresenter
    //    var LeagueTitle : String!
    //    var teamName :String
    override func viewDidLoad() {
        super.viewDidLoad()
        //        Presenter.setViewController(teamDetailsCollectionViewController: self)
        //        Presenter.getTeamDetails(leagueTitle: LeagueTitle)
        print( teamDetailsItem.players?[1].player_age)
        let nib1 = UINib(nibName: "TeamLogo", bundle: nil)
        self.collectionView!.register(nib1, forCellWithReuseIdentifier: "TeamLogo")
        let nib2 = UINib(nibName: "PlayerDetails", bundle: nil)
        self.collectionView!.register(nib2, forCellWithReuseIdentifier: "PlayerDetails")
        
    }
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1 :
            return teamDetailsItem.players.count ==n il ? 5
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
                cell.teamName.text = teamDetailsItem.team_name
                return cell
        default :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerDetails", for: indexPath) as! PlayerDetails

               cell.playerImage.kf.setImage(
                with: URL(string: teamDetailsItem.players![indexPath.row].player_image ?? ""),
                   placeholder: UIImage(named: placeHolder)
               )
            cell.playerName.text = teamDetailsItem.players![indexPath.row].player_name
               return cell
        
        }
    
    }
    
    func getTeamsDetails(teamsDetails: [Team]){
        
        self.teamDetailsItem = teamsDetails[0]
        
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
