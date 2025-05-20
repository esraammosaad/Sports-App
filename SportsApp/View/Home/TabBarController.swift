//
//  TabBarController.swift
//  SportsApp
//
//  Created by Macos on 15/05/2025.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("TabBarController loaded")
        self.navigationItem.title = "Sports"

    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch(selectedIndex){
        case 0 :
            self.navigationItem.title = "Favorites"
        case 1 :
            self.navigationItem.title = "Sports"
        default :
            self.navigationItem.title = "Sports"
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
