//
//  ScreenModifiersType.swift
//  MGM
//
//  Created by Admin on 06.02.2023.
//

import Foundation

enum DetailScreenType {
    case fixture
    case team
    case player
    
    var horizontalCellData: [String] {
        switch self {
        case .fixture:
            return ["Game", "Events", "H2H", "Players Statistics"]
        case .team:
            return ["Team", "Players"]
        case .player:
            return ["Details"]
        }
    }
}
