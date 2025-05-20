//
//  ShowAlert.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 17/05/2025.
//

import Foundation
import UIKit

func showNoInternetAlert() -> UIAlertController{
    let alert = UIAlertController(title: "Warning!", message: "No Internet Connection! Check Your Internet Connection And Try Again!!", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
    return alert
}
