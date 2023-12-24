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
        return "Тип пиццы: \(pizzaType.map { $0.rawValue }), Цена: \(cost), Тесто: \(crustType), Добавки: \(toppings.map { $0.rawValue })"
    }
}

struct FrenchFries: MenuItem {
    let cost: Double
    let size: String // "маленькая", "средняя" или "большая"

    var description: String {
        return "Картощька Фри, Цена: \(cost), Размер: \(size)"
    }
}

protocol OpenClose {
    func open()
    func close()
}

class Pizzeria: OpenClose {
    private var menu: [MenuItem]
    private var employees: [Employee] = []
    var tables: [Table] = []

    init(initialMenu: [MenuItem], initialEmployees: [Employee] = []) {
        menu = initialMenu
        employees = initialEmployees

        createTables()
    }

    private func createTables() {
        tables.append(Table(seats: 4, pizzeria: self))
        tables.append(Table(seats: 6, pizzeria: self))
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

    func addEmployee(newEmployee: Employee) {
        employees.append(newEmployee)
    }

    func open() {
        print("Пиццерия открыта")
    }

    func close() {
        print("Пиццерия закрыта")
    }
}

struct Employee {
    enum Position {
        case cashier
        case chef
    }

    let name: String
    let salary: Double
    let position: Position
}

class Table {
    private var availableSeats: Int
    private var pizzeria: Pizzeria?

    init(seats: Int, pizzeria: Pizzeria) {
        self.availableSeats = seats
        self.pizzeria = pizzeria
    }

    func seatGuests(_ guestsCount: Int) -> Bool {
        guard availableSeats >= guestsCount else {
            print("Мест недостаточно")
            return false
        }

        print("Мест для гостей хватило")
        availableSeats -= guestsCount
        return true
    }
}

extension Table {
    var assignedPizzeria: Pizzeria? {
        return pizzeria
    }
}


// Создание пиццерии
let initialMenu: [MenuItem] = [
    Pizza(cost: 10.99, pizzaType: [.margherita], crustType: "тонкое", toppings: [.cheese]),
    Pizza(cost: 12.99, pizzaType: [.pepperoni], crustType: "толстое", toppings: [.cheese, .pepperoni])
]

let initialEmployees: [Employee] = [
    Employee(name: "Иван", salary: 15.0, position: .cashier),
    Employee(name: "Фёдор", salary: 20.0, position: .chef)
]

let pizzeria = Pizzeria(initialMenu: initialMenu, initialEmployees: initialEmployees)

pizzeria.open()

let newEmpl = Employee(name: "Евгений", salary: 18.0, position: .cashier)
pizzeria.addEmployee(newEmployee: newEmpl)

let allItemsInMenu = pizzeria.getAllItems()
for item in allItemsInMenu {
    print(item.description)
}

let newPizzaInMenu = Pizza(cost: 16.99, pizzaType: [.barbecueChicken], crustType: "толстое", toppings: [.cheese, .tomatoes])
pizzeria.addItem(newItem: newPizzaInMenu)


let table = pizzeria.tables[0]
let success = table.seatGuests(3)
print("Уселись успешно: \(success)")

pizzeria.close()
