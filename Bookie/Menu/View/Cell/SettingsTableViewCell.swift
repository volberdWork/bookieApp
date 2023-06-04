//
//  SettingsTableViewCell.swift
//  Bookie
//
//  Created by newAccount on 05.06.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    
    @IBOutlet var arrowIconImageView: UIImageView!
    @IBOutlet var cellSwitch: UISwitch!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var leftImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .customLightGrey
        self.layer.cornerRadius = 12
        
        titleLabel.font = .displayFont(ofSize: 17, fontType: .SFMedium)
        titleLabel.textColor = .white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
        
    }
    
    func configureCell(model: SettingsModel){
        leftImageView.image = UIImage(named: model.imageName)
        cellSwitch.isHidden = model.isSwitch
        titleLabel.text = model.title
        arrowIconImageView.image = UIImage(named: model.arrowIcon)
    }
    
}

struct SettingsModel{
    var imageName: String
    var title: String
    var isSwitch: Bool
    var arrowIcon: String
}
