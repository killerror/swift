protocol MenuItem {
    var description: String { get }
}

struct Pizza: MenuItem {
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

    var description: String {
        return "Pizza Type: \(pizzaType.map { $0.rawValue }), Cost: \(cost), Crust: \(crustType), Toppings: \(toppings.map { $0.rawValue })"
    }
}

struct FrenchFries: MenuItem {
    let cost: Double
    let size: String // "маленькая", "средняя" или "большая"

    var description: String {
        return "French Fries, Cost: \(cost), Size: \(size)"
    }
}

protocol OpenClose {
    func open()
    func close()
}

class Pizzeria: OpenClose {
    private var menu: [MenuItem]

    init(initialMenu: [MenuItem]) {
        menu = initialMenu
    }

    func addItem(newItem: MenuItem) {
        menu.append(newItem)
    }

    func getAllItems() -> [MenuItem] {
        menu
    }

    func addMenuItem(newItem: MenuItem) {
        menu.append(newItem)
    }

    func open() {
        print("Pizzeria is now open!")
    }

    func close() {
        print("Pizzeria is now closed.")
    }
}

func subtract<T: Numeric>(_ a: T, _ b: T) -> T {
    return a - b
}

let initialMenu: [MenuItem] = [
    Pizza(cost: 10.99, pizzaType: [.margherita], crustType: "тонкое", toppings: [.cheese]),
    Pizza(cost: 12.99, pizzaType: [.pepperoni], crustType: "толстое", toppings: [.cheese, .pepperoni])
]

let pizzeria = Pizzeria(initialMenu: initialMenu)

pizzeria.open()

let newPizza = Pizza(cost: 14.99, pizzaType: [.vegetarian], crustType: "тонкое", toppings: [.cheese, .tomatoes])
pizzeria.addItem(newItem: newPizza)

let newFries = FrenchFries(cost: 4.99, size: "средняя")
pizzeria.addMenuItem(newItem: newFries)

let allItems = pizzeria.getAllItems()

for item in allItems {
    print(item.description)
}

pizzeria.close()
let resultInt = subtract(10, 5)
let resultDouble = subtract(15.5, 7.2)
print("Result (Int): \(resultInt), Result (Double): \(resultDouble)")
