
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

class Pizzeria {
    private var pizzas: [Pizza]

    init(initialPizzas: [Pizza]) {
        pizzas = initialPizzas
    }

    func addPizza(newPizza: Pizza) {
        pizzas.append(newPizza)
    }

    func getAllPizzas() -> [Pizza] {
        pizzas
    }
}

let initialPizzas = [Pizza(cost: 10.99, pizzaType: [.margherita], crustType: "тонкое", toppings: [.cheese]),
                     Pizza(cost: 12.99, pizzaType: [.pepperoni], crustType: "толстое", toppings: [.cheese, .pepperoni])]

let pizzeria = Pizzeria(initialPizzas: initialPizzas)

let newPizza = Pizza(cost: 14.99, pizzaType: [.vegetarian], crustType: "тонкое", toppings: [.cheese, .tomatoes])
pizzeria.addPizza(newPizza: newPizza)

let allPizzas = pizzeria.getAllPizzas()
for pizza in allPizzas {
    print("Pizza Type: \(pizza.pizzaType.map { $0.rawValue }), Cost: \(pizza.cost), Crust: \(pizza.crustType), Toppings: \(pizza.toppings.map { $0.rawValue })")
}
