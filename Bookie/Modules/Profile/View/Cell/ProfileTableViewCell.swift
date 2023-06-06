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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        circleView.layer.cornerRadius = circleView.frame.size.height/2
        circleView.backgroundColor = .customYellow
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
