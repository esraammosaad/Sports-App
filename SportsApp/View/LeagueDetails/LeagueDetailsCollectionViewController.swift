//
//  LeagueDetailsCollectionViewController.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 12/05/2025.
//

import UIKit
import ShimmerSwift
import Reachability

class LeagueDetailsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout,LeagueDetailsViewProtocol {

    
    
    var leagueID : Int!
    var leagueTitle : String!
    var countryId :Int!
    var category: Int!
    var leagueImage :String!
    var currentSport : SportProtocol!
    var teameLogoPlaceholder : String!
    var isFavorite : Bool!
    private var sportType : String!
    private var image : UIImage!
    private let presenter : LeagueDetailsPresenterProtocol  = LeagueDetailsPresenter()
    private var shimmerView : ShimmeringView!
    private var  rightButton : UIBarButtonItem!
    var reachability : Reachability!
    var isConnectedToInternet : Bool!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        addFavoriteBtn()
        isFavorite = presenter.isFavorite(leagueName: leagueTitle)
        if(isFavorite){
            rightButton.image = UIImage(systemName: "heart.fill")
        }else{
            rightButton.image = UIImage(systemName: "heart")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSportType()
        self.title = leagueTitle
        nibRegistration()
        setupReachability()
        collectionView.alwaysBounceVertical = true
        collectionView.delaysContentTouches = false
        let layout = UICollectionViewCompositionalLayout{index ,environement in
            switch(index){
            case 0 :
                return self.drawSection()
            case 1 :
                return self.drawTeamSection()
            case 2:
                return self.drawSectionVertical()
            default:
                return nil
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        presenter.setViewController(leagueDetailsViewController: self)
    }
    
    func setupReachability() {
        do {
            
            reachability = try Reachability()

            reachability.whenReachable = { reachability in
                self.isConnectedToInternet = true
            }

            reachability.whenUnreachable = { _ in
                self.isConnectedToInternet = false
                let alert = showNoInternetAlert()
                self.present(alert, animated: true)

            }

            try reachability.startNotifier()

        } catch {
            print("Unable to start Reachability: \(error)")
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability.stopNotifier()
    }
    @objc func didTapRightButton() {
        if !isFavorite{
            let savedObj = SavedLeague(leageuName: leagueTitle, imagePath:leagueImage, leagueID: leagueID, countryId: countryId ?? 00, category: category)
            presenter.setFavouriteLeague(SavedLeague: savedObj)
            rightButton.image = UIImage(systemName: "heart.fill")
            isFavorite = true
        }else
        {
           let savedObj =  SavedLeague(leageuName: leagueTitle, imagePath: leagueImage, leagueID: leagueID, countryId: countryId, category: category)
            
            self.showDeleteConfirmationAlert{
                _ in
                self.presenter.deleteFavouriteLeague(savedLeague: savedObj)
                self.rightButton.image = UIImage(systemName: "heart")
                self.isFavorite = false
            }
            
          
        }
    }
    
    
    
    
    func showDeleteConfirmationAlert(handler : @escaping ((UIAlertAction)->Void)) {
        let alert = UIAlertController(
            title: "Delete Favorite",
            message: "Are you sure you want to remove this league from your favorites?",
            preferredStyle: .alert
        )
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: handler)
        alert.addAction(cancel)
        alert.addAction(deleteAction)
        
        self.present(alert, animated: true)
    }
    
    
    private func addFavoriteBtn() {
        rightButton = UIBarButtonItem(
            image: UIImage(systemName: "heart"),
            style: .plain,
            target: self,
            action: #selector(didTapRightButton)
        )
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func nibRegistration() {
        let nib1 = UINib(nibName: "LeagueDetailsCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib1, forCellWithReuseIdentifier: Strings.UPCOMING_EVENTS_CELL_IDENTIFIER)
        let nib2 = UINib(nibName: "LatestEventsCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib2, forCellWithReuseIdentifier: Strings.LATEST_EVENTS_CELL_IDENTIFIER)
        let nib3 = UINib(nibName: "TeamSectionCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib3, forCellWithReuseIdentifier: Strings.TEAM_CELL_IDENTIFIER)
        let headerNib = UINib(nibName: "LeagueDetailsHeaderCollectionReusableView", bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Strings.HEADER_LABEL_IDENTIFIER)
    }
    
    private func setSportType(){
        switch(category){
        case 0:
            currentSport = Football()
            image = UIImage(named: "bg")
            teameLogoPlaceholder = "footballTeam"
            sportType = Strings.FOOTBALL_ENDPOINT
            presenter.getLeagueDetails(sportType: sportType, leagueID: leagueID)
        case 1 :
            currentSport = Basketball()
            image = UIImage(named: "basketballbg")
            teameLogoPlaceholder = "basketballTeam"
            sportType = Strings.BASKETBALL_ENDPOINT
            presenter.getLeagueDetails(sportType: sportType, leagueID: leagueID)
        case 2 :
            currentSport = Tennis()
            image = UIImage(named: "tennisbg")
            teameLogoPlaceholder = "tennisTeam"
            sportType = Strings.TENNIS_ENDPOINT
            presenter.getTnnisEvents(countryId: countryId)

        default:
            currentSport = Cricket()
            image = UIImage(named: "cricketbg")
            sportType = Strings.CRICKET_ENDPOINT
            teameLogoPlaceholder = "cricketTeam"
            presenter.getCricketLeagueDetails(leagueId: leagueID)
           
        }
        presenter.getLeagueTeams(sportType: sportType, leagueID: leagueID)

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return currentSport.upComingEvents.count == 0 ? 1 : currentSport.upComingEvents.count
        case 1: return currentSport.teams.count  == 0 && self.category != 2 ? 8 : currentSport.teams.count
        case 2 :return currentSport.latestEvents.count == 0 ? 3 : currentSport.latestEvents.count
        default: return 0
            
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
            setTeamsImageCell(cell, at: indexPath)
           return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.LATEST_EVENTS_CELL_IDENTIFIER, for: indexPath) as! LatestEventsCollectionViewCell
            configureLatestEventCell(cell, at: indexPath)
            return cell
        }
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
                headerView.headerLabel.text = self.category != 2 ? "Teams" : ""
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
    
    
    
    private func configureUpcomingEventCell(_ cell: LeagueDetailsCollectionViewCell, at indexPath: IndexPath) {
        if currentSport.upComingEvents.count == 0 {
                setupShimmer(cell)
            }else{
                currentSport.configureUpcomingEventCell(cell, at: indexPath)
            }
        cell.layer.cornerRadius = 25
        cell.clipsToBounds = true
        cell.background.image = image
    }
    private func setTeamsImageCell(_ cell: TeamSectionCollectionViewCell, at indexPath: IndexPath){
        if currentSport.teams.count == 0 {
            setupShimmer(cell)
        }else
        {
            currentSport.configureTeamCell(cell, at: indexPath, imageName: teameLogoPlaceholder)
        }
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
    }
    
    private func configureLatestEventCell(_ cell: LatestEventsCollectionViewCell, at indexPath: IndexPath) {
        if currentSport.latestEvents.count == 0
            {
                setupShimmer(cell)
            } else{
                currentSport.configureLatestEventCell(cell, at: indexPath)
            }
        cell.layer.cornerRadius = 25
        cell.clipsToBounds = true
        cell.background.image = image
    }



    
    func updateLeagueDetails(leagueDetails: [Event]){
       currentSport.updateLeagueDetails(leagueDetails: leagueDetails, collectionView: self.collectionView)
    }
    
    func getLeagueTeams(teams :[Team]){
        currentSport.getLeagueTeams(teams: teams,collectionView: self.collectionView)
    }
    
    func updateCricketDetails (cricketEvents :[CricketEvent]){
        currentSport.updateLeagueDetails(leagueDetails: cricketEvents, collectionView: self.collectionView)
    }
    
    func getTennisEvents (tennisEvents :[TennisEvent]){
        currentSport.updateLeagueDetails(leagueDetails: tennisEvents, collectionView: self.collectionView)
    }
    

}



