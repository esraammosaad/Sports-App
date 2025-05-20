//
//  CoreDataUtils.swift
//  SportsApp
//
//  Created by Macos on 10/05/2025.
//

import Foundation
import CoreData
import UIKit

class CoreDataUtils{
    static let shared = CoreDataUtils()
    private var  context:NSManagedObjectContext!
    private var entity:NSEntityDescription!
    
    private init(){
        setDeclarition()
    }
    
    
    func setFavouriteLeague(savedLeague :SavedLeague){
        
        let favouriteLeague = NSManagedObject(entity: entity, insertInto: context)
        
        favouriteLeague.setValue( savedLeague.leageuName, forKey: "leagueName")
        favouriteLeague.setValue( savedLeague.imagePath , forKey: "imagePath")
        favouriteLeague.setValue( savedLeague.countryId, forKey: "countryId")
        favouriteLeague.setValue( savedLeague.category , forKey: "category")
        favouriteLeague.setValue( savedLeague.leagueID, forKey: "leagueID")
        
        
        do {
            try context.save()
            print("saved successfully")
        } catch let error as NSError {
            print("could not save league \(error.localizedDescription)")
        }
        
    }
    
    
    func getFavouriteLeagues () -> [SavedLeague]{
        
        let nsManagedArray = self.readFromCoreData() ?? []
        let savedLeagues = nsManagedArray.compactMap { object in
            let name = object.value(forKey: "leagueName") as? String ?? "name default"
            let imagePath = object.value(forKey: "imagePath") as? String ?? "image path default"
            let countryId = object.value(forKey:"countryId") as? Int ?? 00
            let category = object.value(forKey:"category") as? Int ?? 00
            let leagueID = object.value(forKey:"leagueID") as? Int ?? 00
            
            return  SavedLeague(leageuName: name, imagePath: imagePath, leagueID: leagueID, countryId: countryId, category: category)
           
        }
        return savedLeagues
    }
    
    
    func readFromCoreData() -> [NSManagedObject]?{
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeague")
        
        do{
            let  favouriteLeagesArray =  try context.fetch(fetchReq)
            return favouriteLeagesArray
            
        } catch let errpr as NSError{
            print(errpr.localizedDescription)
        }
        return nil
        
    }
    
    
    func deleteLeagueFromFavourits (savedLeague:SavedLeague) {
        
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeague")
        let predicate = NSPredicate(format: "leagueName == %@", savedLeague.leageuName)
        fetchReq.predicate = predicate
        do {
            let results = try context.fetch(fetchReq)
            for object in results {
                context.delete(object)
            }
            try context.save()
            print("deleted successfully")
        } catch let error as NSError {
            print("could not delete league \(error.localizedDescription)")
        }
    }
    
    private func setDeclarition(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "FavouriteLeague", in: context )
    }
}

