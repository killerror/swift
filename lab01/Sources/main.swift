print("[task1]")
for number in stride(from: 0, through: 100, by: 2) {
    print(number)
}


print("")
print("[task2]")
let firstVariable = 7
let secondVariable = 20

if (firstVariable * secondVariable) > 10 {
    print("Результат перемножения больше 10, значение первой переменной: \(firstVariable)")
} else {
    print("Результат перемножения не больше 10, значение второй переменной: \(secondVariable)")
}

print("")
print("[task3]")
var k = 9
for i in 10...50 where i % 2 == 1 {
    let sum = i + k

    if sum % 2 == 0 {
        k += 2
    } else {
        print("Next")
        continue
    }
}
print("k: \(k)")

print("")
print("[task4]")
k = 9
for i in 10...50 where i % 2 == 1 {
    let sum = i + k

    if sum % 2 == 0 {
        k += 1
    } else {
        print("Next")
        continue
    }
}
print("k: \(k)")
