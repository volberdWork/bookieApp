//
//  FavoriteTeam.swift
//  MGM
//
//  Created by Admin on 06.02.2023.
//

import Foundation

struct FavoriteTeam: Codable {
   
    let icon: String
    let name: String
    let id: String
}

struct FavoritePlayer: Codable {
    let icon: String
    let name: String
    let id: String
}

struct FavoriteEvents: Codable {
    let idLeague: String
    let idFixture: String
    let date: Date
    let homeTeamIcon: String
    let awayTeamIcon: String
    let homeTeamName: String
    let awayTeamName: String
    let isRemind: Bool
}
