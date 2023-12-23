struct Pizza {
    enum PizzaType: String {
        case margherita
        case pepperoni
        case vegetarian
        case hawaiian
        case barbecueChicken
    }

    enum Toppings: String {
        case pepperoni
        case tomatoes
        case cheese
    }

    let cost: Double
    let pizzaType: [PizzaType]
    let crustType: String // "толстое" или "тонкое"
    let toppings: [Toppings]
}

struct FrenchFries {
    let cost: Double
    let size: String // "маленькая", "средняя" или "большая"
}

protocol OpenClose {
    func open()
    func close()
}

class Pizzeria: OpenClose {
    private var items: [Any]

    init(initialItems: [Any]) {
        items = initialItems
    }

    func addItem(newItem: Any) {
        items.append(newItem)
    }

    func getAllItems() -> [Any] {
        items
    }

    func addMenuItem(newItem: Any) {
        items.append(newItem)
    }

    func open() {
        print("Pizzeria is now open!")
    }

    func close() {
        print("Pizzeria is now closed.")
    }
}

func subtract<T: Numeric>(_ a: T, _ b: T) -> T {
    a - b
}

let initialPizzas = [Pizza(cost: 10.99, pizzaType: [.margherita], crustType: "тонкое", toppings: [.cheese]),
                     Pizza(cost: 12.99, pizzaType: [.pepperoni], crustType: "толстое", toppings: [.cheese, .pepperoni])]

let initialItems: [Any] = initialPizzas

let pizzeria = Pizzeria(initialItems: initialItems)

pizzeria.open()

let newPizza = Pizza(cost: 14.99, pizzaType: [.vegetarian], crustType: "тонкое", toppings: [.cheese, .tomatoes])
pizzeria.addItem(newItem: newPizza)

let newFries = FrenchFries(cost: 4.99, size: "средняя")
pizzeria.addMenuItem(newItem: newFries)

let allItems = pizzeria.getAllItems()

for item in allItems {
    if let pizza = item as? Pizza {
        print("Pizza Type: \(pizza.pizzaType.map { $0.rawValue }), Cost: \(pizza.cost), Crust: \(pizza.crustType), Toppings: \(pizza.toppings.map { $0.rawValue })")
    } else if let fries = item as? FrenchFries {
        print("French Fries, Cost: \(fries.cost), Size: \(fries.size)")
    }
}

pizzeria.close()

let resultInt = subtract(10, 5)
let resultDouble = subtract(15.5, 7.2)
print("Result (Int): \(resultInt), Result (Double): \(resultDouble)")
