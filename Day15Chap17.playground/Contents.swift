/*
 Generics
 */

// introducing Generics

enum PetKind {
    case cat
    case dog
}

struct KeeperKind {
    var keeperOf: PetKind
}

let cat = KeeperKind(keeperOf: .cat)
let dog = KeeperKind(keeperOf: .dog)

// types defined by other types

class Cat { }
class Dog { }

class CatOwner { }
class DogOwner { }

// anatomy of generic types
class Owner<Animal> { }

var aCatOwner = Owner<Cat>()

// using type parameters

class CatType {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class DogType {
    var name: String
    init(name: String) {
        self.name = name
    }
}
protocol PetProtocol {
    var name: String { get }
}
extension CatType: PetProtocol { }
extension DogType: PetProtocol { }

class KeeperType<Animal: PetProtocol> {
    var name: String
    var morningCare: Animal
    var afternoonCare: Animal
    init(name: String, morningCare: Animal, afternoonCare: Animal) {
        self.name = name
        self.morningCare = morningCare
        self.afternoonCare = afternoonCare
    }
}
let catDogMan = KeeperType(name: "Cat Dog Man", morningCare: CatType(name: "Mister Smells"), afternoonCare: CatType(name: "Meow Chow"))

// mini-exercise
// 1
let DogDogMan = KeeperType(name: "Dog Dog Man", morningCare: DogType(name: "Rover Comeover"), afternoonCare: DogType(name: "Shaggy MacHaggy"))

// 2
// cannot convert 'type' to expected arguments

// 3

// type constraints

let cats = ["Fluffy", "Toughy"].map { CatType(name: $0) }
let dogs = ["Chewie", "Dewey", "Louie"].map { DogType(name: $0) }

let pets: [PetProtocol] = [CatType(name: "Fluffy"), DogType(name: "Chewie")]

func herd(_ pets: [PetProtocol]) {
    pets.forEach {
        print("Come here \($0.name)")
    }
}

func herd<Animal: PetProtocol>(_ pets: [Animal]) {
    pets.forEach {
        print("Hey \($0.name)")
    }
}

func herd<Animal: DogType>(_ dogs: [Animal]) {
    dogs.forEach {
        print("\($0.name) good!")
    }
}

herd(pets)
herd(cats)
herd(dogs)

extension Array where Element: CatType {
    func purr() {
        forEach {
            print("\($0.name) purrs")
        }
    }
}
cats.purr()

/*
 Come here Fluffy
 Come here Chewie
 Hey Fluffy
 Hey Toughy
 Chewie good!
 Dewey good!
 Louie good!
 Fluffy purrs
 Toughy purrs
 */

// arrays, dictionaries, optionals, generic function parameters


