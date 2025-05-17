//
//  FavouritsViewController.swift
//  SportsApp
//
//  Created by Macos on 15/05/2025.
//

import UIKit
import ShimmerSwift
import Kingfisher

class FavouritsViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    private var presenter = FavouriteLeaguePresenter()
    var favouriteLeagues : [SavedLeague]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = "Favorites"
        presenter.setViewController(viewController: self)
        presenter.getAllFavourite()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavouriteTableViewCell

        cell.contentView.subviews.filter { $0 is ShimmeringView }.forEach {  $0.removeFromSuperview() }
        if(favouriteLeagues == nil){
           let shimmerView = ShimmeringView(frame: cell.bounds)
            shimmerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            cell.contentView.addSubview(shimmerView)
            let placeholderView = UIView(frame: cell.bounds)
            placeholderView.backgroundColor = UIColor.systemGray5
            shimmerView.contentView = placeholderView
            shimmerView.isShimmering = true
            cell.leagueName.text = "Loading"
        }else{
            
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
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
