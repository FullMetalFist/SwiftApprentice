/*
 Pattern Matching
 */

let coordinate = (x:1, y:0, z:0)

// 1
if (coordinate.y == 0) && (coordinate.z == 0) {
    print("along the x axis")
}

// 2
if case (_, 0, 0) = coordinate {
    print("along the x axis")
}

// introducing patterns, basic pattern matching


