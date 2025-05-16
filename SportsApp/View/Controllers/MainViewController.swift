//
//  ViewController.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 09/05/2025.
//

import UIKit

class MainViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
     

    }

    @IBAction func onGetStartedButtonClicked(_ sender: Any) {
     
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let tabBarVC = storyboard.instantiateViewController(withIdentifier: "tabBar") as? TabBarController {
            navigationController?.pushViewController(tabBarVC, animated: true)
        }
    }
    
}

