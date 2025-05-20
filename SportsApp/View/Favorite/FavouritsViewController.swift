//
//  FavouritsViewController.swift
//  SportsApp
//
//  Created by Macos on 15/05/2025.
//

import UIKit
import ShimmerSwift
import Kingfisher
import Reachability
import Lottie


class FavouritsViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    private var presenter = FavouriteLeaguePresenter()
    var favouriteLeagues : [SavedLeague]!
    private let reachability = try! Reachability()
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getAllFavourite()
        tableView.reloadData()
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = "Favorites"
        presenter.setViewController(viewController: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavouriteTableViewCell
        cell.contentView.subviews.filter { $0 is ShimmeringView }.forEach {  $0.removeFromSuperview() }
        if(favouriteLeagues == nil ){
            let shimmerView = ShimmeringView(frame: cell.bounds)
            shimmerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            cell.contentView.addSubview(shimmerView)
            let placeholderView = UIView(frame: cell.bounds)
            placeholderView.backgroundColor = UIColor.systemGray5
            shimmerView.contentView = placeholderView
            shimmerView.isShimmering = true
            cell.leagueName.text = "Loading"
        }else if favouriteLeagues.count == 0 {
            let animationView = LottieAnimationView(name: "your_animation_file") // without ".json" extension

            // Set frame or use Auto Layout
            animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            animationView.center = view.center
            animationView.contentMode = .scaleAspectFit

            // Add to the view
            view.addSubview(animationView)

            // Play the animation
            animationView.play()
            /// on empity faavouries
        }
        else {
            cell.leagueImage.kf.setImage(with: URL(string: favouriteLeagues[indexPath.row].imagePath),placeholder: UIImage(named: favouriteLeagues[indexPath.row].imagePath))
            cell.leagueName.text = favouriteLeagues[indexPath.row].leageuName
            
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(favouriteLeagues == nil)
        {
            return 15
        }else {
            return favouriteLeagues.count
        }
    }
    
    
    func getFavouriteLeagues (favouriteLeagues : [SavedLeague]){
        self.favouriteLeagues = favouriteLeagues
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        showDeleteConfirmationAlert(for: indexPath)
    }
    
    
    func showDeleteConfirmationAlert(for indexPath: IndexPath) {
        let alert = UIAlertController(
            title: "Delete Favorite",
            message: "Are you sure you want to remove this league from your favorites?",
            preferredStyle: .alert
        )
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.presenter.deleteFavouriteLeague(saveLeague: self.favouriteLeagues[indexPath.row])
            self.presenter.getAllFavourite()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if reachability.connection != .unavailable {
            let leagueDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetails") as! LeagueDetailsCollectionViewController
            leagueDetailsViewController.leagueID = favouriteLeagues[indexPath.row].leagueID
            leagueDetailsViewController.leagueTitle = favouriteLeagues[indexPath.row].leageuName
            leagueDetailsViewController.category = favouriteLeagues[indexPath.row].category
            leagueDetailsViewController.countryId = favouriteLeagues[indexPath.row].countryId
            leagueDetailsViewController.leagueImage = favouriteLeagues[indexPath.row].imagePath
            
            leagueDetailsViewController.isSavedLeague = true
            self.navigationController?.pushViewController(leagueDetailsViewController, animated: true)

            
         } else {
           
             let alert = UIAlertController(
                 title: "No Internet Connection",
                 message: "Please check your connection and try again.",
                 preferredStyle: .alert
             )
             alert.addAction(UIAlertAction(title: "OK", style: .default))
             present(alert, animated: true)
         }
    }
    
    
    
}
