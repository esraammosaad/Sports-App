//
//  LatestEventsCollectionViewCell.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 12/05/2025.
//

import UIKit

class LatestEventsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var finalScore: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamImage: UIImageView!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamImage: UIImageView!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var background: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
