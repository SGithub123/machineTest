//
//  MatchCell.swift
//  Assignment_match_tournament
//
//  Created by Sanket Bhamare on 03/07/23.
//

import UIKit

class MatchCell: UITableViewCell {

    @IBOutlet weak var seeDetailsBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var team1Img: UIImageView!
    @IBOutlet weak var team2Img: UIImageView!
    
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var timeLBl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        team1Img.layer.cornerRadius = 20
        team2Img.layer.cornerRadius = 20
        seeDetailsBtn.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
