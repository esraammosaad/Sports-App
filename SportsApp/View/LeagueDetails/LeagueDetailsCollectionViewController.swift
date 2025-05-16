//
//  LeagueDetailsCollectionViewController.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 12/05/2025.
//

import UIKit
import ShimmerSwift

class LeagueDetailsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var leagueID : Int!
    var leagueTitle : String!
    var countryId :Int!
    
    var upComingEvents : [Event] = []
    var latestEvents : [Event] = []
    var teams : [Team] = []
    
    var cricketUpComingEvents : [CricketEvent] = []
    var cricketLatestEvents : [CricketEvent] = []
    
    var tennisUpCommingEvents : [TennisEvent] = []
    var tennisLatestEvents : [TennisEvent] = []
    
    var category: Int!
    var sportType : String!
    var image : UIImage!
    private let presenter = LeagueDetailsPresenter()
    
    var shimmerView : ShimmeringView!

    fileprivate func addFavoriteBtn() {
        let button = UIBarButtonItem(
            image: UIImage(systemName: "heart"),
            style: .plain,
            target: self,
            action: #selector(didTapRightButton)
        )
        navigationItem.rightBarButtonItem = button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSportType()
        self.title = leagueTitle
        
        let nib1 = UINib(nibName: "LeagueDetailsCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib1, forCellWithReuseIdentifier: Strings.UPCOMING_EVENTS_CELL_IDENTIFIER)
        let nib2 = UINib(nibName: "LatestEventsCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib2, forCellWithReuseIdentifier: Strings.LATEST_EVENTS_CELL_IDENTIFIER)
        let nib3 = UINib(nibName: "TeamSectionCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib3, forCellWithReuseIdentifier: Strings.TEAM_CELL_IDENTIFIER)
        let headerNib = UINib(nibName: "LeagueDetailsHeaderCollectionReusableView", bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Strings.HEADER_LABEL_IDENTIFIER)
        let layout = UICollectionViewCompositionalLayout{index ,environement in
            switch(index){
            case 0 :
                return self.drawSection()
            case 2:
                return self.drawSectionVertical()
            case 1 :
                return self.drwaTeamSection()
            default:
                return nil
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        presenter.setViewController(leagueDetailsViewController: self)
        addFavoriteBtn()
    }
    @objc func didTapRightButton() {
        // add to core data
    }

        
    private func setSportType(){
        switch(category){
        case 0:
            image = UIImage(named: "bg")
            sportType = Strings.FOOTBALL_ENDPOINT
            presenter.getLeagueDetails(sportType: sportType, leagueID: leagueID)
            
        case 1 :
            image = UIImage(named: "basketballbg")
            sportType = Strings.BASKETBALL_ENDPOINT
            presenter.getLeagueDetails(sportType: sportType, leagueID: leagueID)
        case 2 :
            image = UIImage(named: "tennisbg")
            sportType = Strings.TENNIS_ENDPOINT
            presenter.getTnnisEvents(countryId: countryId)
        default:
            image = UIImage(named: "cricketbg")
            sportType = Strings.CRICKET_ENDPOINT
            presenter.getCricketLeagueDetails(leagueId: leagueID)
        }
        
        presenter.getLeagueTeams(sportType: sportType, leagueID: leagueID)
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            switch category {
            case 0 ,1 :
                return  upComingEvents.count
            case 2 :
                return tennisUpCommingEvents.count
            default:
                return cricketUpComingEvents.count
            }
        case 1:
            return teams.count
        default:
            switch category {
            case 3:
                return cricketLatestEvents.count
            case 2 :
                return tennisLatestEvents.count
            default:
                return latestEvents.count
            }
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.UPCOMING_EVENTS_CELL_IDENTIFIER, for: indexPath) as! LeagueDetailsCollectionViewCell
            configureUpcomingEventCell(cell, at: indexPath)
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.TEAM_CELL_IDENTIFIER, for: indexPath) as! TeamSectionCollectionViewCell
            configureTeamCell(cell, at: indexPath)
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.LATEST_EVENTS_CELL_IDENTIFIER, for: indexPath) as! LatestEventsCollectionViewCell
            configureLatestEventCell(cell, at: indexPath)
            return cell
        }
    }
    
    private func configureUpcomingEventCell(_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath) {
        cell.contentView.subviews.filter { $0 is ShimmeringView }.forEach {  $0.removeFromSuperview() }
        switch category {
        case 0, 1:
            if(upComingEvents.count == 0){
                sectionOneShimmer(cell)
            }else{
                configureUpComingFootballAndBasktballCell(cell, at: indexPath)
            }
            
        case 2 :
            if(tennisUpCommingEvents.count == 0){
                sectionOneShimmer(cell)
            }else{
                configureUpComingTEnnisEvents(cell, at: indexPath)
            }
        case 3:
            if(cricketUpComingEvents.count == 0){
                sectionOneShimmer(cell)
            }else{
                configureUpComingCricketEvents(cell, at: indexPath)
            }
        default:
            configureUpComingFootballAndBasktballCell(cell, at: indexPath)
        }
        cell.layer.cornerRadius = 25
        cell.clipsToBounds = true
        cell.background.image = image
    }
    
    private func configureUpComingFootballAndBasktballCell (_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath){
        cell.contentView.subviews
            .filter { $0 is ShimmeringView }
            .forEach { $0.removeFromSuperview() }
        cell.homeTeamName.text = upComingEvents[indexPath.row].event_home_team
        cell.awayTeamName.text = upComingEvents[indexPath.row].event_away_team
        cell.date.text = upComingEvents[indexPath.row].event_date
        cell.time.text = upComingEvents[indexPath.row].event_time
        let homeURL = URL(string: upComingEvents[indexPath.row].home_team_logo ?? "")
        let awayURL = URL(string: upComingEvents[indexPath.row].away_team_logo ?? "")
        cell.homeTeamImage.kf.setImage(with: homeURL)
        cell.awayTeamImage.kf.setImage(with: awayURL)
        
    }
    
    private func configureUpComingTEnnisEvents (_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath){
        cell.contentView.subviews
            .filter { $0 is ShimmeringView }
            .forEach { $0.removeFromSuperview() }
        cell.homeTeamName.text = tennisUpCommingEvents[indexPath.row].event_first_player
        cell.awayTeamName.text = tennisUpCommingEvents[indexPath.row].event_second_player
        cell.date.text = tennisUpCommingEvents[indexPath.row].event_date
        cell.time.text = tennisUpCommingEvents[indexPath.row].event_time
        cell.homeTeamImage.image = UIImage(named: "tennisP1")
        cell.awayTeamImage.image = UIImage(named: "tennisP2")
        //        let homeURL = URL(string: tennisUpCommingEvents[indexPath.row].home_team_logo ?? "")
        //        let awayURL = URL(string: tennisUpCommingEvents[indexPath.row].away_team_logo ?? "")
        //        cell.homeTeamImage.kf.setImage(with: homeURL)
        //        cell.awayTeamImage.kf.setImage(with: awayURL)
    }
    
    private func configureUpComingCricketEvents(_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath){
        cell.contentView.subviews
            .filter { $0 is ShimmeringView }
            .forEach { $0.removeFromSuperview() }
        cell.homeTeamName.text = cricketUpComingEvents[indexPath.row].event_home_team
        cell.awayTeamName.text = cricketUpComingEvents[indexPath.row].event_away_team
        cell.date.text = cricketUpComingEvents[indexPath.row].event_date_start
        cell.time.text = cricketUpComingEvents[indexPath.row].event_time
        let homeURL = URL(string: cricketUpComingEvents[indexPath.row].event_home_team_logo ?? "")
        let awayURL = URL(string: cricketUpComingEvents[indexPath.row].event_away_team_logo ?? "")
        cell.homeTeamImage.kf.setImage(with: homeURL)
        cell.awayTeamImage.kf.setImage(with: awayURL)
    }
    
    private func configureTeamCell(_ cell: TeamSectionCollectionViewCell, at indexPath: IndexPath) {
        cell.contentView.subviews
            .filter { $0 is ShimmeringView }
            .forEach { $0.removeFromSuperview() }
        let placeholderImage: UIImage?
        switch category {
        case 0: placeholderImage = UIImage(named: "footballTeam")
        case 1: placeholderImage = UIImage(named: "baskteballTeam")
        case 2: placeholderImage = UIImage(named: "tennisTeam")
        default: placeholderImage = UIImage(named: "cricketTeam")
        }
        
        cell.teamImage.kf.setImage(with: URL(string: teams[indexPath.row].team_logo ?? ""), placeholder: placeholderImage)
        cell.teamName.text = teams[indexPath.row].team_name
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
    }
    
    private func configureLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath) {
        cell.contentView.subviews
            .filter { $0 is ShimmeringView }
            .forEach { $0.removeFromSuperview() }
        switch category {
        case 0, 1:
            if latestEvents.isEmpty
            {
                secondSectionShimmer(cell)
            } else{
                configureFootballBasketballLatestEventCell(cell, at: indexPath)
            }
        case 2 :
            if  tennisLatestEvents.isEmpty{
                secondSectionShimmer(cell)
            } else{
                configureTennisLatestEventCell(cell, at: indexPath)
            }
            
        case 3:
            if cricketLatestEvents.isEmpty{
                secondSectionShimmer(cell)
            } else {
                configureCricketLatestEventCell(cell, at: indexPath)
            }
            
            
            
        default:
            configureFootballBasketballLatestEventCell(cell, at: indexPath)
        }
        
        cell.layer.cornerRadius = 25
        cell.clipsToBounds = true
        cell.background.image = image
    }
    
    private func configureFootballBasketballLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath) {
        cell.contentView.subviews
            .filter { $0 is ShimmeringView }
            .forEach { $0.removeFromSuperview() }
        cell.homeTeamName.text = latestEvents[indexPath.row].event_home_team
        cell.awayTeamName.text = latestEvents[indexPath.row].event_away_team
        cell.date.text = latestEvents[indexPath.row].event_date
        cell.finalScore.text = latestEvents[indexPath.row].event_final_result
        let homeURL = URL(string: latestEvents[indexPath.row].home_team_logo ?? "")
        let awayURL = URL(string: latestEvents[indexPath.row].away_team_logo ?? "")
        cell.homeTeamImage.kf.setImage(with: homeURL)
        cell.awayTeamImage.kf.setImage(with: awayURL)
    }
    private func configureTennisLatestEventCell (_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath){
        cell.contentView.subviews
            .filter { $0 is ShimmeringView }
            .forEach { $0.removeFromSuperview() }
        cell.homeTeamName.text = tennisLatestEvents[indexPath.row].event_first_player
        cell.awayTeamName.text = tennisLatestEvents[indexPath.row].event_second_player
        cell.date.text = tennisLatestEvents[indexPath.row].event_date
        cell.finalScore.text = tennisLatestEvents[indexPath.row].event_final_result
        cell.homeTeamImage.image = UIImage(named: "tennisP1")
        cell.awayTeamImage.image = UIImage(named: "tennisP2")
        
        //        let homeURL = URL(string: tennisLatestEvents[indexPath.row].home_team_logo ?? "")
        //        let awayURL = URL(string: tennisLatestEvents[indexPath.row].away_team_logo ?? "")
        //        cell.homeTeamImage.kf.setImage(with: homeURL)
        //        cell.awayTeamImage.kf.setImage(with: awayURL)
        
        
        
    }
    private func configureCricketLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath) {
        cell.contentView.subviews
            .filter { $0 is ShimmeringView }
            .forEach { $0.removeFromSuperview() }
        cell.homeTeamName.text = cricketLatestEvents[indexPath.row].event_home_team
        cell.awayTeamName.text = cricketLatestEvents[indexPath.row].event_away_team
        cell.date.text = cricketLatestEvents[indexPath.row].event_date_start
        cell.finalScore.text = cricketLatestEvents[indexPath.row].event_away_final_result
        let homeURL = URL(string: cricketLatestEvents[indexPath.row].event_home_team_logo ?? "")
        let awayURL = URL(string: cricketLatestEvents[indexPath.row].event_away_team_logo ?? "")
        cell.homeTeamImage.kf.setImage(with: homeURL,placeholder: UIImage(named: "cricketTeam"))
        cell.awayTeamImage.kf.setImage(with: awayURL,placeholder: UIImage(named: "cricketTeam"))
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! LeagueDetailsHeaderCollectionReusableView
            
            switch(indexPath.section){
            case 0 :
                headerView.headerLabel.text = "Upcoming Events"
            case 2 :
                headerView.headerLabel.text = "Latest Events"
              default:
                headerView.headerLabel.text = "Teams"

            }
            
            return headerView
        }
        return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 60)
    }
    


    
    
    
 // ---> Shimmer
    
    private func sectionOneShimmer(_ cell: LeagueDetailsCollectionViewCell) {
        let shimmer = ShimmeringView(frame: cell.contentView.bounds)
        shimmer.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        shimmer.isShimmering = true
        
        let loadingView = UIView(frame: shimmer.bounds)
        loadingView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        loadingView.layer.cornerRadius = 15
        shimmer.contentView = loadingView

        cell.contentView.addSubview(shimmer)
    }

    private func secondSectionShimmer(_ cell: LatestEventsCollectionViewCell) {
        let shimmer = ShimmeringView(frame: cell.contentView.bounds)
        shimmer.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        shimmer.isShimmering = true
        
        let loadingView = UIView(frame: shimmer.bounds)
        loadingView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        loadingView.layer.cornerRadius = 15
        shimmer.contentView = loadingView

        cell.contentView.addSubview(shimmer)
    }

    
    
    //Presenter --> Methods
    func updateLeagueDetails(leagueDetails: [Event]){
        latestEvents = leagueDetails.filter{ $0.event_status == "Finished" }
        upComingEvents = leagueDetails.filter{ $0.event_status?.isEmpty ?? false || $0.event_status == nil }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func getLeagueTeams(teams :[Team]){
      
        DispatchQueue.main.async {
            self.teams = teams
            self.collectionView.reloadData()
        }
    }
    
    func udateCricketDetails (cricketEvents :[CricketEvent]){
        cricketLatestEvents = cricketEvents.filter{ $0.event_status == "Finished" }
        cricketUpComingEvents = cricketEvents.filter{ $0.event_status?.isEmpty ?? false || $0.event_status == nil }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func getTennisEvents (tennisEvents :[TennisEvent]){
        tennisLatestEvents = tennisEvents.filter{ $0.event_status == "Finished" }
        tennisUpCommingEvents = tennisEvents.filter{ $0.event_status?.isEmpty ?? false || $0.event_status == nil }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
  
    
}


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
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 18, bottom: 0, trailing: 18)

        self.setHeaderForSection(section: section)
        self.setAnimationToSection(section: section)
        
        return section
    }
    
    
    private func drwaTeamSection()->NSCollectionLayoutSection{
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

    
}
