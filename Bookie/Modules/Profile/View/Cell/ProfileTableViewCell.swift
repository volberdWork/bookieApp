//
//  ProfileTableViewCell.swift
//  Bookie
//
//  Created by newAccount on 05.06.2023.
//

import UIKit
import ALProgressView

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet var progressView: ALProgressRing!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var circleView: UIView!
    @IBOutlet var progressLabel: UILabel!
    
    @IBOutlet var baseView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        circleView.layer.cornerRadius = circleView.frame.size.height/2
        circleView.backgroundColor = .customYellow
        
        contentView.backgroundColor = .clear
        baseView.backgroundColor = .customLightGrey
        baseView.layer.cornerRadius = 17
        
        progressLabel.text = "0"
        progressLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        progressLabel.textColor = .customYellow
        
        titleLabel.text = "Some progress"
        titleLabel.font = .displayFont(ofSize: 17, fontType: .SFMedium)
        titleLabel.textColor = .white
        
        progressView.backgroundColor = .clear
        progressView.lineWidth = 3
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
