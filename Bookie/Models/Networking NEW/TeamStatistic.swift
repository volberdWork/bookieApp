//
//  TeamStatistic.swift
//  MGM
//
//  Created by Admin on 06.02.2023.
//

import Foundation

struct TeamStatistic {
    var teamStatisticTypes: TeamStatisticTypes
    var teamCellValues: [TeamCellValues]
}

struct TeamCellValues {
    var key: String
    var value: String?
}

enum TeamStatisticTypes: String, CaseIterable {
        case played = "played"
        case wins = "wins"
        case draws = "draws"
        case loses = "loses"
        case goalsFor = "goals for"
        case goalsAgaints = "goals Againts"
        case cleanSheet = "clean sheet"
        case failedToScore = " failed to score"
        case cards = "cards"
        case penalty = "penalty"
        case biggest = "Biggest"
}
