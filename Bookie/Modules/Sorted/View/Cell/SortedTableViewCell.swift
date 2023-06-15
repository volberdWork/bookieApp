//
//  SortedTableViewCell.swift
//  Bookie
//
//  Created by newAccount on 12.06.2023.
//

import UIKit

class SortedTableViewCell: UITableViewCell {

    @IBOutlet var circleView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var baseView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.backgroundColor = .customDarkGrey
        baseView.layer.cornerRadius = 11
        
        titleLabel.textColor = .white
        titleLabel.font = .displayFont(ofSize: 17, fontType: .SFMedium)
        
        circleView.layer.cornerRadius = 11
        circleView.backgroundColor = .clear
        circleView.layer.borderWidth = 2
        circleView.layer.borderColor = CGColor(red: 240/255, green: 137/255, blue: 51/255, alpha: 1)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: String){
        if model.count == 1{
            baseView.backgroundColor = .clear
            circleView.isHidden = true
        } else{
            baseView.backgroundColor = .customDarkGrey
            circleView.isHidden = false
        }
    }
    
}
