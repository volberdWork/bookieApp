//
//  AllEventsCollectionViewCell.swift
//  Bookie
//
//  Created by newAccount on 06.06.2023.
//

import UIKit

class AllEventsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var awayNameLabel: UILabel!
    @IBOutlet var homeNameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var baseView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.backgroundColor = .clear
        baseView.layer.cornerRadius = 14
        baseView.clipsToBounds = true
        
        timeLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        timeLabel.textColor = .white
        
        typeLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        typeLabel.textColor = .customYellow
        
        homeNameLabel.font = .displayFont(ofSize: 25, fontType: .SFBold)
        homeNameLabel.textColor = .customYellow
        
        awayNameLabel.font = .displayFont(ofSize: 25, fontType: .SFBold)
        awayNameLabel.textColor = .customYellow
        
        placeLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        placeLabel.textColor = .customYellow
        
    }
    
    

}
