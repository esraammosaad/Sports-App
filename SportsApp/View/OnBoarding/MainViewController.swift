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
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
            UserDefaults.standard.hasOnboarded = true
        
    }
    
}

