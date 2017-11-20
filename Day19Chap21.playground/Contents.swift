/*
 Error Handling
 */

// what is error handling, first level error handling with optionals

// failable initializers

let value = Int("3")

let failedValue = Int("Nah")

enum PetFood: String {
    case kibble, canned
}

let morning = PetFood(rawValue: "kibble")
let snack = PetFood(rawValue: "Fooood")

struct PetHouse {
    let squareFeet: Int
    init?(squareFeet: Int) {
        if squareFeet < 1 {
            return nil
        }
        self.squareFeet = squareFeet
    }
}

let tooSmall = PetHouse(squareFeet: 0)
let justRight = PetHouse(squareFeet: 2)

// optional chaining

//class Pet {
//    var breed: String?
//    init(breed: String? = nil) {
//        self.breed = breed
//    }
//}
//class Person {
//    let pet: Pet
//    init(pet: Pet) {
//        self.pet = pet
//    }
//}
//let pug = Pet(breed: "Pug")
//let unknown = Pet()
//
//let jan = Person(pet: unknown)
////let whatKindIsIt = jan.pet.breed!
//
//if let dogBreed = jan.pet.breed {
//    print("Olive is a \(dogBreed)")
//} else {
//    print("we will never know")
//}

class Toy {
    enum Kind {
        case ball
        case chew
        case bone
        case mouse
    }
    enum Sound {
        case squeak
        case bell
    }
    let kind: Kind
    let color: String
    var sound: Sound?
    
    init(kind: Kind, color: String, sound: Sound? = nil) {
        self.kind = kind
        self.color = color
        self.sound = sound
    }
}
class Pet {
    enum Kind {
        case dog
        case cat
        case guineaPig
    }
    let name: String
    let kind: Kind
    let favoriteToy: Toy?
    
    init(name: String, kind: Kind, favoriteToy: Toy? = nil) {
        self.name = name
        self.kind = kind
        self.favoriteToy = favoriteToy
    }
}
class Person {
    let pet: Pet?
    init(pet: Pet? = nil) {
        self.pet = pet
    }
}

let jan = Person(pet: Pet(name: "Dog", kind: .dog, favoriteToy: Toy(kind: .ball, color: "Purple", sound: .bell)))
let tam = Person(pet: Pet(name: "Cat", kind: .cat, favoriteToy: Toy(kind: .mouse, color: "Orange")))
let fil = Person()

if let sound = jan.pet?.favoriteToy?.sound {
    print("Sound \(sound)")
} else {
    print("no sound")
}
if let sound = tam.pet?.favoriteToy?.sound {
    print("Sound \(sound)")
} else {
    print("no sound")
}
if let sound = fil.pet?.favoriteToy?.sound {
    print("Sound \(sound)")
} else {
    print("no sound")
}

// map and flatMap
let team = [jan, tam, fil]

let petNames = team.map {  $0.pet?.name }

for pet in petNames {
    print(pet)
}

let betterPetNames = team.flatMap { $0.pet?.name }

for pet in betterPetNames {
    print(pet)
}

// error protocol


