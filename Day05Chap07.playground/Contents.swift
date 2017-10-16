/*
 Arrays, Dictionaries, Sets
 */

// mutable vs immutable

// arrays, what is an array, when are arrays useful?, creating arrays

let primeNumbers = [2, 3, 5, 7, 11, 13]

var subscribers: [String] = []

let bunchOfZeroes = Array(repeating: 0, count: 7)

let vowels = ["A", "E", "I", "O", "U"]

// accessing elements, using properties and methods

var players = ["Alex", "Barbra", "Colin", "Donna"]
print(players.isEmpty)

if players.count < 2 {
    print("we need more than 2 players!")
} else {
    print("lets begin!")
}

var currentPlayer = players.first
print(currentPlayer as Any)
var lastPlayer = players.last
print(lastPlayer as Any)

print([4, 5, 3].first as Any)
print([4, 5, 3].min() as Any)

// using subscripting
var playerOne = players[0]
print("Player One is: \(playerOne)")

// using countable ranges to make an ArraySlice
let upcomingPlayersSlice = players[1...2]
print(upcomingPlayersSlice[1], upcomingPlayersSlice[2])

let biggerPlayersSlice = Array(players[1...3])
print(biggerPlayersSlice[0], biggerPlayersSlice[1], biggerPlayersSlice[2])

func isEliminated(player: String) -> Bool {
    return !players.contains(player)
}

print(isEliminated(player: "Dude"))

players[0...3].contains("Dude")

// modifying arrays, appending elements

players.append("Evan")

players += ["Greg"]

players.insert("Fiona", at: 5)

// removing elements

var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed")
removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed")

// mini-exercise
players.index(of: "Donna")

// updating elements

print(players)
players[3] = "Evander"
print(players)

players[0...1] = ["Louis", "Harry", "Joaquin"]
print(players)

// moving elements

players.swapAt(0, 4)
print(players)
players.sort()
print(players)

// iterating through an array

let scores = [3, 4, 4, 1, 5, 2]

for player in players {
    print(player)
}

for (index, player) in players.enumerated() {
    print("\(index + 1). \(player)")
}

func sumOfElements(in array: [Int]) -> Int {
    var sum = 0
    for num in array {
        sum += num
    }
    return sum
}

// mini-exercise

for (index, player) in players.enumerated() {
    print("\(player) received \(scores[index]) points")
}

/*
 Running time for array operations
 */

// accessing elements O(1), inserting elements O(N), deleting O(N), searching for an element O(N)


/*
 Dictionaries
 */

// creating dictionaries

var namesAndScores = ["Alex": 3, "Barbra": 2, "Colin": 1, "Donna": 5]
print(namesAndScores)

var pairs: [String: Int] = [:]
pairs.reserveCapacity(30)

// accessing values, using subscripting

print(namesAndScores["Alex"])
print(namesAndScores["Dude"])

// using properties and methods
namesAndScores.isEmpty
namesAndScores.count
pairs.isEmpty
pairs.count

// modifying dictionaries, adding pairs

var trollBobData = [
    "name": "Bob",
    "profession": "Poker Professional",
    "country": "USA"
]

trollBobData.updateValue("CA", forKey: "state")
trollBobData["city"] = "Sacramento"

// mini-exercise

func printCityAndState(player: Dictionary<String, String>) {
    print("\(String(describing: player["city"])), \(String(describing: player["state"]))")
}

trollBobData.updateValue("Bobby", forKey: "name")
trollBobData["profession"] = "Truck driver"
print(trollBobData)

// removing pairs
trollBobData.removeValue(forKey: "state")
trollBobData["city"] = nil
print(trollBobData)

// iterating through dictionaries
for (player, score) in namesAndScores {
    print("\(player) - \(score)")
}

for player in namesAndScores.keys {
    print("\(player) ", separator: ",", terminator: "")
}

// running time for dictionary operations
print("this hash".hashValue)
print("🛫".hashValue)
print(77.hashValue)
print(true.hashValue)

// accessing elements O(1), inserting elements O(1), deleting elements O(1), searching for elements O(1)

/*
 Sets
 */

// creating sets
let setOne: Set<Int>

let someArray = [1, 2, 3, 1]
var someSet: Set<Int> = [1, 2, 3, 1]
print(someArray)
print(someSet)

// accessing elements
print(someSet.contains(1))
print(someSet.contains(7))

// first & last properties also work, however sets are unordered

// adding and removing elements
someSet.insert(7)

let removedElement = someSet.remove(1)
print(removedElement!)

// running time for set operations O(1)

/*
 Challenges
 */

// 1
let answerStatement1 = """
valid
invalid
valid
(array4)
valid
invalid
valid
invalid (let means array is immutable)
invalid
(array5)
valid
valid
invalid
invalid
valid
"""

// 2
func removingOnce(_ item: Int, from array: [Int]) -> [Int] {
    var temp = array
    let removeIndex = temp.index(of:item)!
    temp.remove(at: removeIndex)
    return temp
}

let secondOldArray = [2, 3, 5, 6]
let secondNewArray = removingOnce(3, from: secondOldArray)

// 3
func removing(_ item: Int, from array: [Int]) -> [Int] {
    var temp = array
    for (index, num) in temp.enumerated() {
        if num == item {
            temp.remove(at: index)  // why doesn't this function as intended? (only removes the first found item)
        }
    }
    return temp
}

let thirdOldArray = [1,2,3,1,2,5,6,7,1,2,8,9,1,2,3,4]
let thirdNewArray = removing(1, from: thirdOldArray)

// 4
func newReverse(array: [Int]) -> [Int] {
    var temp: [Int] = []
    for num in array {
        temp.insert(num, at: 0)
    }
    return temp
}

let fourthOldArray = [5,4,3,2,1]
let fourthNewArray = newReverse(array: fourthOldArray)

// 5
// TODO
import Foundation
func randomFromZero(to number: Int) -> Int {
    return Int(arc4random_uniform(UInt32(number)))
}

func randomized(_ array: [Int]) -> [Int] {
    var temp: [Int] = []
    while temp.count != array.count {
        let element = array[randomFromZero(to: array.count)]
        temp.append(element)
    }
    return temp
}

let fifthArray = randomized([3,2,6,8,0,1,7])

// 6
// TODO
func minMax(of numbers: [Int]) -> (min: Int, max: Int)? {
    if numbers.isEmpty {
        return nil
    }
    var min = 0
    var max = 0
    
    return (min: min, max: max)
}

// 7
let answerStatement7 = """
invalid
invalid
valid
(dict4)
invalid
valid
valid
invalid
(dict5)
valid
valid
valid
"""

// 8
// TODO


// 9
// TODO
func merging(_ dict1: [String: String], with dict2: [String: String]) -> [String: String] {
    
    return ["":""]
}

// 10
// TODO
func occurencesOfCharacters(in text: String) -> [Character: Int] {
    return ["a":0]
}

// 11
// TODO
func isInvertible(_ dictionary: [String: Int]) -> Bool {
    return true
}

// 12
var nameTitleLookup: [String: String?] = ["Mary": "Engineer", "Patrick": "Intern", "Raymond": "Hacker"]
nameTitleLookup.updateValue(nil, forKey: "Patrick")
print(nameTitleLookup)
nameTitleLookup["Raymond"] = nil
print(nameTitleLookup)


