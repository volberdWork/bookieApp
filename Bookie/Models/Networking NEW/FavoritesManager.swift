//
//  FavoritesManager.swift
//  MGM
//
//  Created by Admin on 06.02.2023.
//

import Foundation

class FavoritesManager {
    
    static var shared = FavoritesManager()
    
    func setDataToFavorites<T: Codable>(data: T,for key: FavoriteKey) {
        var array = getDataFromFavorite(from: key) as [T]
        array.append(data)
        saveData(encodeData: array, key: key.rawValue)
    }
    
    func removeDataFromFavorites(index: Int, for key: FavoriteKey) {
        switch key {
        case .team:
            var array = getDataFromFavorite(from: key) as [FavoriteTeam]
            array.remove(at: index)
            saveData(encodeData: array, key: key.rawValue)
        case .player:
            var array = getDataFromFavorite(from: key) as [FavoritePlayer]
            array.remove(at: index)
            saveData(encodeData: array, key: key.rawValue)
        case .event:
            var array = getDataFromFavorite(from: key) as [FavoriteEvents]
            array.remove(at: index)
            saveData(encodeData: array, key: key.rawValue)
        }
    }
    
    func getDataFromFavorite<T: Codable>(from key: FavoriteKey) -> [T] {
        return retrieveData(key: key)
    }
    
    private func saveData<T: Encodable>(encodeData: [T], key: String) {
        let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(encodeData) {
               print("saved")
               UserDefaults.standard.set(encoded, forKey: key)
           }
    }
    
    private func retrieveData<T:Decodable>(key: FavoriteKey) -> [T] {
        var array:[T] = []
        if let savedData = UserDefaults.standard.object(forKey: key.rawValue) as? Data {
            print("tryToRetrieve")
                let decoder = JSONDecoder()
                if let loadedData = try? decoder.decode([T].self, from: savedData) {
                   print("retrieved")
                    array = loadedData
                }
        }
        return array
    }
}

enum FavoriteKey: String {
    case team = "team"
    case player = "player"
    case event = "event"
}
