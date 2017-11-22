/*
 Encoding and Decoding Types
 */

import Foundation

// the encodable and decodable protocol

// encodeable protocol
//func encode(to: Encoder) throws

// decodable protocol
//init(from decoder: Decoder) throws

// what is codable?

//typealias Codable = Encodable & Decodable

// automatic encoding and decoding

struct Employee {
    var name: String
    var id: Int
    var favoriteToy: Toy
    
    enum CodingKeys: String, CodingKey {
        case id = "employeeId"
        case name
        case gift
    }
}

struct Toy: Codable {
    var name: String
}

// encoding and decoding custom types

// {"name": "dude", "id": 3}

// JSONEncoder and JSONDecoder

let toy1 = Toy(name: "Bear")
let employee1 = Employee(name: "dude", id: 3, favoriteToy: toy1)

//let jsonEncoder = JSONEncoder()
//let jsonData = try jsonEncoder.encode(employee1)
//
//let jsonString = String(data: jsonData, encoding: .utf8)
//
//let jsonDecoder = JSONDecoder()
//let employee2 = try jsonDecoder.decode(Employee.self, from: jsonData)

// renaming properties with CodingKeys, CodingKey protocol, CodingKey enum

// manual encoding and decoding

// the encode function

extension Employee: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
        try container.encode(favoriteToy.name, forKey: .gift)
    }
}

// the decode function

extension Employee: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        let gift = try values.decode(String.self, forKey: .gift)
        favoriteToy = Toy(name: gift)
    }
}

let jsonEncoder = JSONEncoder()
let jsonData = try jsonEncoder.encode(employee1)

let jsonString = String(data: jsonData, encoding: .utf8)

let jsonDecoder = JSONDecoder()

/*
 Challenges
 */

// 1
struct Spaceship {
    var name: String
    var crew: [Spaceman]
    enum CodingKeys: String, CodingKey {
        case name = "spaceship_name"
        case crew
    }
}
struct Spaceman {
    var name: String
    var race: String
    enum CodingKeys: String, CodingKey {
        case name
        case race
    }
}

extension Spaceship: Encodable {
    // I peeked
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(crew, forKey: .crew)
    }
    
}
extension Spaceman: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(race, forKey: .race)
    }
}
extension Spaceship: Decodable {
    enum CrewKeys: String, CodingKey {
        case captain
        case officer
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        let crewValues = try decoder.container(keyedBy: CrewKeys.self)
        let captain: Spaceman = try crewValues.decode(Spaceman.self, forKey: .captain)
        let officer: Spaceman = try crewValues.decode(Spaceman.self, forKey: .officer)
        crew = [captain, officer]
    }
}
extension Spaceman: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        race = try values.decode(String.self, forKey: .race)
    }
}

let message = "{\"spaceship_name\": \"USS Dude\", \"captain\":{\"name\":\"Spock\", \"race\":\"Human-Vulcan\"},\"officer\":{\"name\": \"Worf\", \"race\":\"Klingon\"}}"
let spaceship = try JSONDecoder().decode(Spaceship.self, from: message.data(using: .utf8)!)

print(spaceship)
