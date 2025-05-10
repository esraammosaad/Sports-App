//
//  ViewController.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 09/05/2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let api = APIServices()
      api.getFootballLeagues(){ response ,error in
          
          if let response {
              
           print( LeagueResponse.fromJson(response: response))
                            
          }else{
              print(error!)
          }
      }
        
     
 
    }


}

