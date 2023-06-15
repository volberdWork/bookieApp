import Foundation

struct EventsBase : Codable {
    let get : String?
    let parameters : ParametersEvents?
    let errors : [String]?
    let results : Int?
    let paging : PagingEvents?
    let response : [ResponseEvents]?
}

struct PagingEvents : Codable {
    let current : Int?
    let total : Int?
}

struct AssistEvents : Codable {
    let id : Int?
    let name : String?
}

struct ParametersEvents : Codable {
    let fixture : String?
}

struct PlayerEvents : Codable {
    let id : Int?
    let name : String?
}

struct ResponseEvents : Codable {
    let time : TimeEvents?
    let team : TeamEvents?
    let player : PlayerEvents?
    let assist : AssistEvents?
    let type : String?
    let detail : String?
    let comments : String?
}

struct TeamEvents : Codable {
    let id : Int?
    let name : String?
    let logo : String?
}

struct TimeEvents : Codable {
    let elapsed : Int?
    let extra : Int?
}
