//
//  ImageTableViewCell.swift
//  Bookie
//
//  Created by newAccount on 26.06.2023.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet var imageViewLineUp: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
