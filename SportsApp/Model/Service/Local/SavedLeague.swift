//
//  SavedLeage.swift
//  SportsApp
//
//  Created by Macos on 10/05/2025.
//

import Foundation

class SavedLeague : Equatable{
   
    
   
    
    
    let leageuName :String
    let imagePath :String
    let leagueID : Int
    let countryId : Int
    let category : Int
    
    init(leageuName: String, imagePath: String, leagueID: Int, countryId: Int, category: Int) {
        self.leageuName = leageuName
        self.imagePath = imagePath
        self.leagueID = leagueID
        self.countryId = countryId
        self.category = category
    }
    

    
    static func == (lhs: SavedLeague, rhs: SavedLeague) -> Bool {
        return lhs.leageuName == rhs.leageuName &&
                  lhs.imagePath == rhs.imagePath &&
                  lhs.leagueID == rhs.leagueID &&
                  lhs.countryId == rhs.countryId &&
                  lhs.category == rhs.category
    }
    
}
