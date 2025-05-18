//
//  ViewProtocol.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 17/05/2025.
//

import Foundation

protocol SportDetailsViewProtocol{
    
    func updateLeagues(leagues : [League])
    func getFavouriteLEagues(favouriteLEagues : [SavedLeague])
    
}
