//
//  AllEventsCollectionViewCell.swift
//  Bookie
//
//  Created by newAccount on 06.06.2023.
//

import UIKit

class AllEventsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var awayNameLabel: UILabel!
    @IBOutlet var homeNameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var baseView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.backgroundColor = .clear
        baseView.layer.cornerRadius = 14
        baseView.clipsToBounds = true
        
        timeLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        timeLabel.textColor = .white
        
        typeLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        typeLabel.textColor = .customYellow
        
        homeNameLabel.font = .displayFont(ofSize: 18, fontType: .SFBold)
        homeNameLabel.textColor = .white
        
        awayNameLabel.font = .displayFont(ofSize: 18, fontType: .SFBold)
        awayNameLabel.textColor = .white
        
        placeLabel.font = .displayFont(ofSize: 14, fontType: .SFBold)
        placeLabel.textColor = .white
        
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
          
        placeLabel.text = model.fixture?.venue?.name ?? ""
          
          homeNameLabel.text = model.teams?.home?.name ?? ""
          awayNameLabel.text = model.teams?.away?.name ?? ""
        
        
    }
    
    

}
