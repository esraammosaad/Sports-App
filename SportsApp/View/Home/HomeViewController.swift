//
//  HomeViewController.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 11/05/2025.
//

import UIKit
import Reachability

private let reuseIdentifier = "cell"


class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    var allLeaguesResponse : [League]!
    var reachability : Reachability!
    var isConnectedToInternet : Bool! = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.navigationItem.title = "Sports"
        
       let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
       self.collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        setupReachability()


    }
    
    func setupReachability() {
        do {
            
            reachability = try Reachability()

            reachability.whenReachable = { reachability in
                self.isConnectedToInternet = true
                print("internet")
            }

            reachability.whenUnreachable = { _ in
                self.isConnectedToInternet = false
                let alert = showNoInternetAlert()
                self.present(alert, animated: true)
                print("no internet")

            }

            try reachability.startNotifier()
            self.isConnectedToInternet = reachability.connection != .unavailable

        } catch {
            print("Unable to start Reachability: \(error)")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability.stopNotifier()
    }

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
    
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
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
            cell.sportImage.image = UIImage(named: "foot")
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! SportDetailsViewController
    switch(indexPath.row){
        case 0:
            vc.category = 0
        case 1:
            vc.category = 1
        case 2:
            vc.category = 2
        default:
            vc.category = 3
        }
        setupReachability()
        
        if(isConnectedToInternet){
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            
           let alert = showNoInternetAlert()
           self.present(alert, animated: true)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.bounds.width - 12*3)/2, height: self.view.bounds.height/4)
    }
    


}
