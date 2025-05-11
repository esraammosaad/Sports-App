//
//  EventResponse.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 10/05/2025.
//

import Foundation
class EventResponse{
    
    var result : [[String : Any]]?
    var success : Int?
    
    static func fromJson(response : [String : Any]) -> [Event]{
        let eventResponse = EventResponse()
        var eventsList : [Event] = []
        eventResponse.result = response["result"] as? [[String : Any]]
        eventResponse.success = response["sucess"] as? Int

        for i in eventResponse.result! {
            eventsList.append(Event.fromJson(response: i))
        }
       return eventsList
    }
}

