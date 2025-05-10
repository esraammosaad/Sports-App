//
//  ViewController.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 09/05/2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    var league : League!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url =  "\(Strings.BASEURL)\(Strings.FOOTBALL_ENDPOINT)/?met=\(Strings.LEAGUES_ENDPOINT)&APIkey=\(Strings.API_KEY)"
        
        let apiService = APIService()
        apiService.execute(url: url ){ response ,error in
            
            if let response {
                
                let arr = response["result"] as? [[String : Any]]
                
                
                self.league = League.fromJson(response: arr![0])
                
                print(self.league.league_logo)
              
              
                
            }else{
                print(error!)
            }
  
        }
    }


}

