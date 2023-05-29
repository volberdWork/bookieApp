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
   
    }

    func setupCell(model: PreloaderModel){
        
    }
    
}
