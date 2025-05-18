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
    
    init(leageuName: String, imagePath: String) {
        self.leageuName = leageuName
        self.imagePath = imagePath
    }
    
    static func == (lhs: SavedLeague, rhs: SavedLeague) -> Bool {
        return lhs.leageuName == rhs.leageuName && lhs.imagePath == rhs.imagePath
    }
    
}
