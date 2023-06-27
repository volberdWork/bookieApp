import Foundation

struct LineUpBase : Codable {
	let get : String?
	let parameters : ParametersLU?
	let errors : [String]?
	let results : Int?
	let paging : PagingLU?
	let response : [ResponseLineUp]?
}

struct PagingLU : Codable {
    let current : Int?
    let total : Int?
}

struct ResponseLineUp : Codable {
    let team : TeamLU?
    let coach : CoachLU?
    let formation : String?
    let startXI : [StartXILU]?
    let substitutes : [SubstitutesLU]?
}

struct CoachLU : Codable {
    let id : Int?
    let name : String?
    let photo : String?
}

struct ParametersLU : Codable {
    let fixture : String?
}

struct PlayerLU : Codable {
    let id : Int?
    let name : String?
    let number : Int?
    let pos : String?
    let grid : String?
}

struct StartXILU : Codable {
    let player : PlayerLU?
}

struct SubstitutesLU : Codable {
    let player : PlayerLU?
}

struct TeamLU : Codable {
    let id : Int?
    let name : String?
    let logo : String?
    let colors : ColorsLU?
}

struct ColorsLU : Codable {
    let player : PlayersLU?
    let goalkeeper : GoalkeeperLU?
}

struct GoalkeeperLU : Codable {
    let primary : String?
    let number : String?
    let border : String?
}

struct PlayersLU: Codable{
    let primary : String
    let number : String
    let border : String
}
