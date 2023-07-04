//
//  TeamCell.swift
//  Assignment_match_tournament
//
//  Created by Sanket Bhamare on 04/07/23.
//

import UIKit

class TeamCell: UITableViewCell {
    @IBOutlet weak var teamB_name: UILabel!
    
    @IBOutlet weak var teamA_name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
