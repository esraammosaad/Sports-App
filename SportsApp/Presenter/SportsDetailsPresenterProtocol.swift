//
//  SportsDetailsPresenterProtocol.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 20/05/2025.
//

import Foundation

protocol SportsDetailsPresenterProtocol{
    
    func setViewController(sportDetailsVireController : SportDetailsViewProtocol)
    func getSportDetails(sportType : String)
    
}
