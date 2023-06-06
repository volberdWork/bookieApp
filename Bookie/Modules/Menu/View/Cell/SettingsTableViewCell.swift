//
//  SettingsTableViewCell.swift
//  Bookie
//
//  Created by newAccount on 05.06.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    
    @IBOutlet var selectorView: UIView!
    @IBOutlet var baseView: UIView!
    @IBOutlet var arrowIconImageView: UIImageView!
    @IBOutlet var cellSwitch: UISwitch!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var leftImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.backgroundColor = UIColor(red: 36/255, green: 37/255, blue: 38/255, alpha: 1)
        
        
        self.backgroundColor = .clear
        
        titleLabel.font = .displayFont(ofSize: 17, fontType: .SFMedium)
        titleLabel.textColor = .white
        selectorView.isHidden = true
        arrowIconImageView.contentMode = .center
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
        
    }
    
    func configureCell(model: SettingsList){
        leftImageView.image = UIImage(named: model.leftImageName)
        cellSwitch.isHidden = model.switchIsHidden
        titleLabel.text = model.nameText
        arrowIconImageView.image = UIImage(named: model.rightImageName)
    }
    
}

struct SettingsModel{
    var imageName: String
    var title: String
    var isSwitch: Bool
    var arrowIcon: String
}
