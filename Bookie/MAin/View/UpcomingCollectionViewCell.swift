//
//  UpcomingCollectionViewCell.swift
//  Bookie
//
//  Created by newAccount on 03.06.2023.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var awayTeamLabel: UILabel!
    @IBOutlet var homeTeamLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var baseVIew: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseVIew.layer.cornerRadius = 14
        baseVIew.clipsToBounds = true
        backgroundImage.image = UIImage(named: "upcomingImage")
        
        typeLabel.textColor = .customYellow
        typeLabel.font = .displayFont(ofSize: 25, fontType: .SFBold)
        
        timeLabel.textColor = .white
        timeLabel.font = .displayFont(ofSize: 25, fontType: .SFBold)
        timeLabel.textAlignment = .left
        
        homeTeamLabel.textColor = .white
        homeTeamLabel.font = .displayFont(ofSize: 25, fontType: .SFBold)
        homeTeamLabel.textAlignment = .left
        
        awayTeamLabel.textColor = .white
        awayTeamLabel.font = .displayFont(ofSize: 25, fontType: .SFBold)
        awayTeamLabel.textAlignment = .left
        
        
    }
    
    func setupCell(model: String){
        
    }

}
