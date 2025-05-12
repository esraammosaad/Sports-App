//
//  EventResponse.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation
struct EventResponse : Decodable{
    
    var result : [Event]?
    var success : Int
    
}

