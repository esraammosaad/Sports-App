//
//  LeagueDetailsCollectionViewController.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 12/05/2025.
//

import UIKit

private let reuseIdentifier = "cell"
private let reuseIdentifier2 = "cell2"

class LeagueDetailsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "UEFA Champions League"

        let nib1 = UINib(nibName: "LeagueDetailsCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib1, forCellWithReuseIdentifier: reuseIdentifier)
        let nib2 = UINib(nibName: "LatestEventsCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib2, forCellWithReuseIdentifier: reuseIdentifier2)
        
        
        let headerNib = UINib(nibName: "LeagueDetailsHeaderCollectionReusableView", bundle: nil)
        collectionView.register(headerNib,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "header")
        
        
        let layout = UICollectionViewCompositionalLayout{index ,environement in
            
            switch(index){
            case 1:
                
                return self.drawSectionVertical()
                
            case 0 :
                return self.drawSection()
                
            default:
                return self.drawSection()
            }
            
        }
        
        self.collectionView.setCollectionViewLayout(layout, animated: true)
    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    
    


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : UICollectionViewCell!

        switch(indexPath.section){
          case 0:
             cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LeagueDetailsCollectionViewCell
           
          default:
             cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath) as! LatestEventsCollectionViewCell
           
        }
        
        cell.layer.cornerRadius = 25
        cell.clipsToBounds = true
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
               let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header",
                    for: indexPath) as! LeagueDetailsHeaderCollectionReusableView
            
            switch(indexPath.section){
              case 0 :
                headerView.headerLabel.text = "Upcoming Events"
              default:
                headerView.headerLabel.text = "Latest Events" 
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
    
    
    func drawSection() -> NSCollectionLayoutSection{
        //item size
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

        // item >> size
        let item = NSCollectionLayoutItem(layoutSize: bigItemSize)
        
        //groupsize
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
 
       //group >> size , item
        let myGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        myGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
        
      //section >> group
       let section = NSCollectionLayoutSection(group: myGroup)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
        
        self.setHeaderForSection(section: section)
        self.setAnimationToSection(section: section)


        
        return section
    }
    
    
    func setAnimationToSection(section : NSCollectionLayoutSection){

        //------ animation ----
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
    
    


    
    
    



}
