//
//  MatchTableViewCell.swift
//  Bookie
//
//  Created by newAccount on 07.06.2023.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var eventLabel: UILabel!
    @IBOutlet var eventImageView: UIImageView!
    @IBOutlet var baseView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        eventLabel.font = .displayFont(ofSize: 17, fontType: .SFMedium)
        eventLabel.textColor = .white

        numberLabel.font = .displayFont(ofSize: 17, fontType: .SFMedium)
        numberLabel.textColor = .customYellow
        
        baseView.backgroundColor = .customLightGrey

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
