//
//  PlayerStatistic.swift
//  MGM
//
//  Created by Admin on 06.02.2023.
//

import Foundation

struct PlayerStatistic {
    var playerStatisticTypes: PlayerStatisticTypes
    var playerCellValues: [PlayerCellValues]
}

struct PlayerCellValues {
    var key: String
    var value: String?
}

enum PlayerStatisticTypes: String, CaseIterable {
        case games = "games"
        case substitutes = "substitutes"
        case shots = "shots"
        case goals = "goals"
        case passes = "passes"
        case tackles = "tackles"
        case duels = "duels"
        case dribbles = "dribbles"
        case fouls = "fouls"
        case cards = "cards"
        case penalty = "penalty"
}
