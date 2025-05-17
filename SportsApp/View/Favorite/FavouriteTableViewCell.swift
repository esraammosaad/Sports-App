//
//  FavouriteTableViewCell.swift
//  SportsApp
//
//  Created by Macos on 17/05/2025.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
