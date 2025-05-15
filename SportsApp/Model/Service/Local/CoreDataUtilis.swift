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
    
    var  context:NSManagedObjectContext!
    var entity:NSEntityDescription!
    
    init(){
        setDeclarition()
    }
    
    
    func setFavouriteLeague(name : String , imagePath : String){
        
        let favouriteLeague = NSManagedObject(entity: entity, insertInto: context)
        favouriteLeague.setValue( name, forKey: "leagueName")
        favouriteLeague.setValue( imagePath , forKey: "imagePath")
        
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
            return SavedLeague(leageuName: name, imagePath: imagePath)
        }
        return savedLeagues
    }
    
    
    private func readFromCoreData() -> [NSManagedObject]?{
        
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

