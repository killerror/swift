import Foundation

print("[task1]----------------------------------------------------")

func calculateDepositAmount(initialAmount: Double, annualInterestRate: Double, numberOfYears: Int) -> Double {
    let interestRate = 1 + (annualInterestRate / 100)
    let finalAmount = initialAmount * pow(Double(interestRate), Double(numberOfYears))
    return finalAmount
}

let depositAmount = calculateDepositAmount(initialAmount: 1000, annualInterestRate: 5, numberOfYears: 3)
print("Через 3 года на вкладе будет $\(depositAmount)")



print("")
print("[task2]+[task3]--------------------------------------------")

enum PizzaType: String {
    case margherita = "Маргарита"
    case pepperoni = "Пепперони"
    case veggie = "Вегетарианская"
}

let margheritaPizza = PizzaType.margherita
let pepperoniPizza = PizzaType.pepperoni
let veggiePizza = PizzaType.veggie

print("Вид пиццы: \(margheritaPizza.rawValue)")
print("Вид пиццы: \(pepperoniPizza.rawValue)")
print("Вид пиццы: \(veggiePizza.rawValue)")