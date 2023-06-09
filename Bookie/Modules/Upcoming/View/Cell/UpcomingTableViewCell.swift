//
//  UpcomingTableViewCell.swift
//  Bookie
//
//  Created by newAccount on 08.06.2023.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.backgroundColor = .customLightGrey
        
        titleLabel.font = .displayFont(ofSize: 17, fontType: .SFMedium)
        titleLabel.textColor = .white
    }
    
}
