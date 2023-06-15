//
//  GetData.swift
//  Bookie
//
//  Created by newAccount on 14.06.2023.
//

import Foundation
func getCurrentDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let currentDate = Date()
    let formattedDate = dateFormatter.string(from: currentDate)
    return formattedDate
}

func getTomorrowDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    if let tomorrowDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) {
        let formattedDate = dateFormatter.string(from: tomorrowDate)
        return formattedDate
    } else {
        return "" // В случае ошибки возвращаем пустую строку
    }
}
