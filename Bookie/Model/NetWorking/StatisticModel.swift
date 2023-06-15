import Foundation

// MARK: - Welcome3
struct FixtureStatistics: Codable {
    let welcome3Get: String?
    let parameters: ParametersST?
    let errors: [String?]
    let results: Int?
    let paging: PagingST?
    let response: [ResponseST]?
}

// MARK: - Paging
struct PagingST: Codable {
    let current, total: Int?
}

// MARK: - Parameters
struct ParametersST: Codable {
    let fixture: String?
}

// MARK: - Response
struct ResponseST: Codable {
    let team: TeamST?
    let statistics: [StatisticST]?
}

struct StatisticST: Codable {
    let type: String?
    let value: StatisticValue?
}

enum StatisticValue: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        if let intValue = try? decoder.singleValueContainer().decode(Int.self) {
            self = .integer(intValue)
        } else if let stringValue = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(stringValue)
        } else {
            throw DecodingError.typeMismatch(StatisticValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Не удалось декодировать значение статистики"))
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}


// MARK: - Team
struct TeamST: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
