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
        typeLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        
        timeLabel.textColor = .white
        timeLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        timeLabel.textAlignment = .left
        
        homeTeamLabel.textColor = .white
        homeTeamLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        homeTeamLabel.textAlignment = .left
        
        awayTeamLabel.textColor = .white
        awayTeamLabel.font = .displayFont(ofSize: 17, fontType: .SFBold)
        awayTeamLabel.textAlignment = .left
        
        baseVIew.backgroundColor = .clear
        
        
        
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
        
        
        homeTeamLabel.text = model.teams?.home?.name ?? ""
        awayTeamLabel.text = model.teams?.away?.name ?? ""
        
        print(model.league?.id ?? 0)
        print(model.teams?.home?.id ?? 0)
    }

}
