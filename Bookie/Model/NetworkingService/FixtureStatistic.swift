//
//  FixtureStatistic.swift
//  MGM
//
//  Created by Admin on 06.02.2023.
//

import Foundation

struct FixtureStatistic {
    let teamName: String
    let teamsStat: [FixtureTeamStat]
}

struct FixtureTeamStat {
    let type: String
    let value: String
}
