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


