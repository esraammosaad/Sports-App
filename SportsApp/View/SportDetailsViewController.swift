//
//  SportDetailsViewController.swift
//  SportsApp
//
//  Created by Macos on 12/05/2025.
//

import UIKit
import Kingfisher
import ShimmerSwift

class SportDetailsViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var footballLeagues : [League]!
    var  shimmerView : ShimmeringView!
    var category: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        NetworkService.getFootballLeagues(){
            leaguesResponse in
            if let leagues = leaguesResponse?.result {
                self.footballLeagues = leagues
                self.tableView.reloadData()
            }
        }
        
        self.title = setTitle()
        
        // Do any additional setup after loading the view.
        //
    }
    private func setTitle () -> String{
        if category == 0
            {return "Football"}
        else if category == 1
            {return " second Option"}
        else if category == 2
            {return "third option"}
        else if category == 3
            {return "last option"}
        else
        { return "sport Details"}
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(footballLeagues == nil)
        {
            return 15
        }else {
            return footballLeagues.count
        }// will be updated
        
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

            cell.leagueName.text = footballLeagues[indexPath.row].league_name ?? "league"
            cell.LeagueImage.kf.setImage(with: URL(string: footballLeagues[indexPath.row].league_logo ?? ""), placeholder: UIImage(named: "footballPlaceHolder"))

            let radius = CGRectGetWidth(cell.LeagueImage.frame) / 2
            cell.LeagueImage.layer.cornerRadius = radius
            cell.LeagueImage.layer.masksToBounds = true
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Return a fixed height for all cells
        return 100    }
    
}
