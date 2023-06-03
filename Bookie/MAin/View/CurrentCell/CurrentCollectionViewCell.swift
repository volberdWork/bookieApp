//
//  CurrentCollectionViewCell.swift
//  Bookie
//
//  Created by newAccount on 03.06.2023.
//

import UIKit

class CurrentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var baseView: UIView!
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var awayPointLabel: UILabel!
    @IBOutlet var homePointLabel: UILabel!
    @IBOutlet var awayNameLabel: UILabel!
    @IBOutlet var homeNameLabel: UILabel!
    @IBOutlet var awayLogoImageView: UIImageView!
    @IBOutlet var homeLogoImageView: UIImageView!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.layer.cornerRadius = 14
        baseView.clipsToBounds = true
        
        timeLabel.textColor = .white
        timeLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        timeLabel.textAlignment = .left
        
        typeLabel.textColor = .white
        typeLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        typeLabel.textAlignment = .right
        
        placeNameLabel.textColor = .white
        placeNameLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        placeNameLabel.textAlignment = .center
        
        homePointLabel.textColor = .white
        homePointLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        homePointLabel.textAlignment = .center
        
        awayPointLabel.textColor = .white
        awayPointLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        awayPointLabel.textAlignment = .center
        
        homeNameLabel.textColor = .white
        homeNameLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        homeNameLabel.textAlignment = .left
        
        awayNameLabel.textColor = .white
        awayNameLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        awayNameLabel.textAlignment = .left
    }
    
    
    
    
    
}
