menu = {"Pepperoni": 1.75, "Extra Cheese": 1.75, "Plain": 1.50, "Sicilian":2.00}
def print_menu(menu):
    global codigos_pizza
    codigo = 1
    for codigo,valor in enumerate(menu,start=1):
        print str(codigo) + " " + valor + " " + str(menu[valor])

def get_orders():
    pedido = []
    number_pizza = 1
    while number_pizza != -1:
        number_pizza = int(raw_input("Numero da pizza: "))
        if number_pizza > 0 and number_pizza <= len(menu):
            pedido.append(number_pizza-1)
        elif number_pizza != -1:
            print "Pizza nao existe"
    return pedido 
    

def print_orders(orders,menu):
    for i in orders:
        print menu.keys()[i]


def compute_total(orders,menu):
    soma = 0
    for i in orders:
        soma = soma + menu.values()[i]
    return soma

print_menu(menu)   
orders = get_orders()   
print orders
print_orders(orders,menu)  
compute_total(orders,menu)
