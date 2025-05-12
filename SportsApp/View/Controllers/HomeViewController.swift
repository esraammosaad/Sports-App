//
//  HomeViewController.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 11/05/2025.
//

import UIKit

private let reuseIdentifier = "cell"


class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    var allLeaguesResponse : [League]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.navigationItem.title = "Sports"
        
        
        
       let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
       self.collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
//
//        NetworkService.getFootballLeagueDetails(leagueID: 4 ){
//            leagueDetailsResponse in
//               if let leagueDetails = leagueDetailsResponse?.result {
//                   print("heyy")
//                   print(leagueDetails[0].country_name?.trimmingCharacters(in: .whitespacesAndNewlines))
//               }
//        }
//        NetworkService.getFootballLeagueTeams(leagueID: 4){
//            leagueTeamResponse in
//               if let leagueTeam = leagueTeamResponse?.result {
//                   print("heyy")
//                   print(leagueTeam[0].players?[0].player_name?.trimmingCharacters(in: .whitespacesAndNewlines))
//               }
//        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 26
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        
        cell.sportImage.layer.masksToBounds = false
        cell.sportImage.layer.cornerRadius = 10
        cell.sportImage.clipsToBounds = true
        cell.layer.masksToBounds = false
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        
        switch(indexPath.row){
        case 0:
            cell.sportName.text = "Football"
        case 1:
            cell.sportName.text = "Basketball"
            cell.sportImage.image = UIImage(named: "basket")
        case 2:
            cell.sportName.text = "Tennis"
            cell.sportImage.image = UIImage(named: "tenn")
        default:
            cell.sportName.text = "Cricket"
            cell.sportImage.image = UIImage(named: "cricket")
        
        }
    
        
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row == 0 ){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! SportDetailsViewController
            vc.category = 0
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 270)
    }
    



}
