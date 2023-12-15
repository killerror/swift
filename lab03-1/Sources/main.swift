let teaPrices = ["Черный чай": 50, "Зеленый чай": 60, "Фруктовый чай": 40]

let teaOrders = ["Черный чай", "Зеленый чай", "Фруктовый чай", "Красный чай", "Черный чай"]

func processTeaOrders(orders: [String]) {
    var totalCost = 0

    for (index, order) in orders.enumerated() {
        if let price = teaPrices[order] {
            totalCost += price
            print("Покупатель \(index + 1): заказал \(order), стоимость \(price) руб., общая стоимость заказа \(totalCost) руб.")
        } else {
            print("Покупатель \(index + 1): заказал \(order), но этот вид чая не найден в меню.")
        }
    }
}

processTeaOrders(orders: teaOrders)
