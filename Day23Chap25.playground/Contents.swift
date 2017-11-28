/*
 Protocol-Oriented Programming
 */

// introducing protocol extensions

extension String {
    func shout() {
        print(uppercased())
    }
}

"Swift is okay".shout()

protocol TeamRecord {
    var wins: Int { get }
    var losses: Int { get }
    // made better due to extension
    //var winningPercentage: Double { get }
}

extension TeamRecord {
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses)
    }
}

extension TeamRecord {
    var gamesPlayed: Int {
        return wins + losses
    }
}

struct BaseballRecord: TeamRecord {
    var wins: Int
    var losses: Int
    
    // made better due to extension
//    var winningPercentage: Double {
//        return Double(wins) / Double(wins + losses)
//    }
}

let sanFranSwift = BaseballRecord(wins: 16, losses: 6)
sanFranSwift.gamesPlayed
sanFranSwift.winningPercentage

// default implementations

struct BasketballRecord: TeamRecord {
    var wins: Int
    var losses: Int
    
    let seasonLength = 82
    
    // made better due to extension
//    var winningPercentage: Double {
//        return Double(wins) / Double(wins + losses)
//    }
}

let clevelandCompilers = BasketballRecord(wins: 60, losses: 22)
clevelandCompilers.winningPercentage

//struct HockeyRecord: TeamRecord {
//    var wins: Int
//    var losses: Int
//    var ties: Int
//
//    // Hockey record has ties, so winningPercentage function changes accordingly
//    var winningPercentage: Double {
//        return Double(wins) / Double(wins + losses + ties)
//    }
//}
//
//let phoenixFunctions = HockeyRecord(wins: 1, losses: 9, ties: 8)
//phoenixFunctions.winningPercentage

// mini-exercise (had to peek)

extension CustomStringConvertible {
    var description: String {
        return "Don'g forget to implement CustomStringConvertible!"
    }
}

// understanding protocol extension dispatching

protocol WinLoss {
    var wins: Int { get }
    var losses: Int { get }
}
extension WinLoss {
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses)
    }
}

struct BaseketballRecord: WinLoss {
    var wins: Int
    var losses: Int
    var draws: Int
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses + draws)
    }
}

let tallahaseeTurnips = BaseketballRecord(wins: 8, losses: 1, draws: 3)
let winLoss: WinLoss = tallahaseeTurnips

tallahaseeTurnips.winningPercentage // 0.66
winLoss.winningPercentage           // 0.88

// type constraints

protocol PostSeasonEligible {
    var minimumWinsForPlayoffs: Int { get }
}


extension TeamRecord where Self: PostSeasonEligible {
    var isPlayoffEligible: Bool {
        return wins > minimumWinsForPlayoffs
    }
}

struct HockeyRecord: TeamRecord {
    var wins: Int
    var losses: Int
    var ties: Int
}

protocol Tieable {
    var ties: Int { get }
}
extension TeamRecord where Self: Tieable {
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses + ties)
    }
}

struct RugbyRecord: TeamRecord, Tieable {
    var wins: Int
    var losses: Int
    var ties: Int
}

let raccoonCityReindeer = RugbyRecord(wins: 9, losses: 2, ties: 3)
raccoonCityReindeer.winningPercentage


// mini-exercise (had to peek)

// extension of protocol 'TeamRecord' cannot have an inheritance clause ??
//extension TeamRecord: CustomStringConvertible {
//    var description: String {
//        return "\(wins) - \(losses)"
//    }
//}

// protocol-oriented benefits, programming to interfaces, not implementations

// traits, mixins, and multiple inheritance

protocol TieableRecord {
    var ties: Int { get }
}

protocol DivisionalRecord {
    var divisionalWins: Int { get }
    var divisionalLosses: Int { get }
}

protocol ScorableRecord {
    var totalPoints: Int { get }
}

extension ScorableRecord where Self: TieableRecord, Self: TeamRecord {
    var totalPoints: Int {
        return (2 * wins) + (1 * ties)
    }
}

struct NewHockeyRecord: TeamRecord, TieableRecord, DivisionalRecord, CustomStringConvertible, Equatable {
    var wins: Int
    var losses: Int
    var ties: Int
    var divisionalWins: Int
    var divisionalLosses: Int
    var description: String {
        return "\(wins) - \(losses) - \(ties)"
    }
    static func ==(lhs: NewHockeyRecord, rhs: NewHockeyRecord) -> Bool {
        return lhs.wins == rhs.wins &&
                lhs.ties == rhs.ties &&
                lhs.losses == rhs.losses
    }
}

// simplicity, why Swift is a protocol-oriented language

/*
 Challenges
 */
