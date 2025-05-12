//
//  LeagueDetailsCollectionViewCell.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 12/05/2025.
//

import UIKit

class LeagueDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeTeamImage: UIImageView!
    
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var awayTeamImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
