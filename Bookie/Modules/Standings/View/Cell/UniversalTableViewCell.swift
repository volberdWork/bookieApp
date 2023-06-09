//
//  UniversalTableViewCell.swift
//  Bookie
//
//  Created by newAccount on 07.06.2023.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {

    @IBOutlet var baseView: UIView!
    @IBOutlet var rightLabel: UILabel!
    @IBOutlet var leftLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        leftLabel.font = .displayFont(ofSize: 17, fontType: .SFMedium)
        leftLabel.textColor = .white
        
        rightLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        rightLabel.textColor = .customYellow
        self.backgroundColor = .clear
        baseView.backgroundColor = .customLightGrey
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    
    
}
