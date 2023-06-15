//
//  CurrentCollectionViewCell.swift
//  Bookie
//
//  Created by newAccount on 03.06.2023.
//

import UIKit
import Kingfisher

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
        timeLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        timeLabel.textAlignment = .left
        
        typeLabel.textColor = .customYellow
        typeLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        typeLabel.textAlignment = .right
        
        placeNameLabel.textColor = .white
        placeNameLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        placeNameLabel.textAlignment = .center
        
        homePointLabel.textColor = .white
        homePointLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        homePointLabel.textAlignment = .center
        
        awayPointLabel.textColor = .white
        awayPointLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        awayPointLabel.textAlignment = .center
        
        homeNameLabel.textColor = .white
        homeNameLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        homeNameLabel.textAlignment = .left
        
        awayNameLabel.textColor = .white
        awayNameLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        awayNameLabel.textAlignment = .left
        
        backgroundImageView.image = UIImage(named: "liveImage")
        backgroundImageView.contentMode = .scaleToFill
        
        baseView.backgroundColor = .clear
    }
    
    func convertDateFormat(_ dateString: String) -> String? {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "HH:mm dd/MM/yyyy"
        
        if let date = inputDateFormatter.date(from: dateString) {
            let formattedDate = outputDateFormatter.string(from: date)
            return formattedDate
        } else {
            return nil // В случае ошибки возвращаем nil
        }
    }
    
    func setupCell(model: Response){
        var fullText = convertDateFormat(model.fixture?.date ?? "")
        timeLabel.text = fullText
        typeLabel.text = model.fixture?.status?.short ?? ""
 
        let attributedString = NSMutableAttributedString(string: fullText ?? "")

        // Устанавливаем стиль для первых пяти символов
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.displayFont(ofSize: 17, fontType: .SFBold)
        ]
        let range = NSRange(location: 0, length: min(5, fullText!.count))
        attributedString.addAttributes(boldAttributes, range: range)

        // Устанавливаем стиль для остальных символов
        let mediumAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.displayFont(ofSize: 17, fontType: .SFMedium)
        ]
        let remainingRange = NSRange(location: range.length, length: fullText!.count - range.length)
        attributedString.addAttributes(mediumAttributes, range: remainingRange)

        // Применяем атрибутированную строку к вашему UILabel
        
        timeLabel.attributedText = attributedString
        
        homeNameLabel.text = model.teams?.home?.name ?? ""
        awayNameLabel.text = model.teams?.away?.name ?? ""
        
        homePointLabel.text = "\(model.goals?.home ?? 0)"
        awayPointLabel.text = "\(model.goals?.away ?? 0)"
        
        homeLogoImageView.kf.setImage(with: URL(string: model.teams?.home?.logo ?? ""))
        awayLogoImageView.kf.setImage(with: URL(string: model.teams?.away?.logo ?? ""))
        
        placeNameLabel.text = model.fixture?.venue?.city ?? ""
        
        
    }
    
    
}
