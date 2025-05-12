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
        
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "main") as! HomeViewController
        
        self.navigationController?.setViewControllers([homeViewController], animated: true)
    }
    
}

