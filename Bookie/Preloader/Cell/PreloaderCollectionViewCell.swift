//
//  PreloaderCollectionViewCell.swift
//  Bookie
//
//  Created by newAccount on 29.05.2023.
//

import UIKit

class PreloaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var logoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = .displayFont(ofSize: 19, fontType: .SFMedium)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .customYellow
        
        logoImageView.contentMode = .scaleToFill
    }

    func setupCell(model: PreloaderModel){
        titleLabel.text = model.title
        
        let logo = UIImage(named: model.imageName)
        logoImageView.image = logo
    }
    
}
