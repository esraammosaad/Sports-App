//
//  SportDetailsViewController.swift
//  SportsApp
//
//  Created by Macos on 12/05/2025.
//

import UIKit
import Kingfisher
import ShimmerSwift

class SportDetailsViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, SportDetailsViewProtocol {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var footballLeagues : [League]!
    var  shimmerView : ShimmeringView!
    var category: Int!
    var sportTitle : String!
    var sportType : String!
    var imagePlaceHolder :String!
    var favouriteLEagues : [SavedLeague] = []
    let presenter = SportDetailsPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSportType()
        tableView.delegate = self
        tableView.dataSource = self
       
        presenter.setViewController(sportDetailsVireController: self)
        presenter.getSportDetails(sportType: sportType)
        
        self.title = sportTitle
        
        
    }
    
    
    private func setSportType(){
        
        switch(category){
        case 0 :
            sportType = Strings.FOOTBALL_ENDPOINT
            sportTitle = "Football"
        case 1 :
            sportType = Strings.BASKETBALL_ENDPOINT
            sportTitle = "Basketball"
        case 2 :
            sportType = Strings.TENNIS_ENDPOINT
            sportTitle = "Tennis"
        default :
            sportType = Strings.CRICKET_ENDPOINT
            sportTitle = "Cricket"
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(footballLeagues == nil)
        {
            return 15
        }else {
            return footballLeagues.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SportDetailsCell
        
        cell.contentView.subviews.filter { $0 is ShimmeringView }.forEach {  $0.removeFromSuperview() }
        if(footballLeagues == nil){
            let shimmerView = ShimmeringView(frame: cell.bounds)
            shimmerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            cell.contentView.addSubview(shimmerView)
            let placeholderView = UIView(frame: cell.bounds)
            placeholderView.backgroundColor = UIColor.systemGray5
            shimmerView.contentView = placeholderView
            shimmerView.isShimmering = true
            cell.leagueName.text = "Loading"
            cell.LeagueImage.image = nil
        }else{
            
            switch (category) {
            case 0:
                imagePlaceHolder = "footballPlaceHolder"
            case 2:
                imagePlaceHolder = "tennisLeague"
            case 1 :
                imagePlaceHolder = "basketballLeague"
            default :
                imagePlaceHolder = "cricketLeague"
            }
            
            cell.leagueName.text = footballLeagues[indexPath.row].league_name ?? "league"
            cell.LeagueImage.kf.setImage(with: URL(string: footballLeagues[indexPath.row].league_logo ?? ""), placeholder: UIImage(named: imagePlaceHolder))
            let radius = CGRectGetWidth(cell.LeagueImage.frame) / 2
            cell.LeagueImage.layer.cornerRadius = radius
            cell.LeagueImage.layer.masksToBounds = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
        
    }
    
    
    func updateLeagues(leagues : [League]){
        self.footballLeagues = leagues
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func getFavouriteLEagues(favouriteLEagues: [SavedLeague]) {
        self.favouriteLEagues = favouriteLEagues
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let leagueDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetails") as! LeagueDetailsCollectionViewController
        leagueDetailsViewController.leagueID = footballLeagues[indexPath.row].league_key
        leagueDetailsViewController.leagueTitle = footballLeagues[indexPath.row].league_name
        leagueDetailsViewController.category = self.category
        leagueDetailsViewController.leagueImage = footballLeagues[indexPath.row].league_logo == nil ? imagePlaceHolder : footballLeagues[indexPath.row].league_logo
        
        leagueDetailsViewController.countryId = footballLeagues[indexPath.row].country_key
        
        var savedObj = SavedLeague(leageuName : footballLeagues[indexPath.row].league_name! , imagePath: (footballLeagues[indexPath.row].league_logo == nil ? imagePlaceHolder : footballLeagues[indexPath.row].league_logo) ?? imagePlaceHolder)
   
        presenter.getAllFavourite()
        
        if favouriteLEagues.contains(savedObj) {
            leagueDetailsViewController.isSavedLeague = true
           
        }else{
            leagueDetailsViewController.isSavedLeague = false
        }
            
            self.navigationController?.pushViewController(leagueDetailsViewController, animated: true)
            
    }
    
}
