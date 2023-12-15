func generateArray(_ n: Int) -> [Int] {
    var result = [Int]()
    
    for i in 0..<n {
        result.append(1 << i)
    }
    
    return result
}

let inputNumber = 5
let resultArray = generateArray(inputNumber)
print(resultArray)
