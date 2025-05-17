//
//  UserDefaults+Extension.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 16/05/2025.
//

import Foundation
extension UserDefaults{
    
    private enum UserDefaultsKeys : String{
        
        case hasOnboarded
        
    }
    
    var hasOnboarded : Bool{
        
        get {
            
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
            
        }
        
        set {
            
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
            
        }
        
        
    }
    
    
}
