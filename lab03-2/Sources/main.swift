let originalArray: [Int?] = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]

let newArray = originalArray.compactMap { $0 }.filter { $0 != 0 && $0 != 4 }.sorted()

print(newArray)
