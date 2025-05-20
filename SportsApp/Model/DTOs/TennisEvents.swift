//
//  TennisEvents.swift
//  SportsApp
//
//  Created by Macos on 16/05/2025.
//

import Foundation
struct TennisEvent :Decodable, EventProtocol {

    var event_key :Int?
    var event_date : String?
    var event_time : String?
    var event_first_player :String?
    var event_second_player :String?
    var event_final_result :String?
    var event_status :String?
    
    
}

