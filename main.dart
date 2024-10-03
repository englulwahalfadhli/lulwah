class Item {
  String name; // Initializing variables
  double price;

  Item(this.name, this.price); // Specifying name and price

  String displayItem() {
    return ('$name is \$$price');
  }
}

/////////////////////////////////////////////////////
class ItemStock {
  Item item;
  int stock;

  // Specify which item and stock
  ItemStock(this.item, this.stock);

  //  check if the item is available in stock
  bool isInStock() {
    return (stock > 0); // Returns true if the item is available
  }
}

//////////////////////////////////////////////////////
class VendingMachine {
  List<ItemStock> items = []; // list of Items

  //add an item with its stock
  void addItem(Item item, int stockCount) {
    // Check if the item  is in the items list
    for (var itemStock in items) {
      if (itemStock.item.name == item.name) {
        itemStock.stock += stockCount; // Increase stock if item exists
        return;
      }
    }
    // If the item doesn't exist, add a new ItemStock
    items.add(ItemStock(item, stockCount));
  }

  //select an item by name
  void selectItem(String itemName) {
    // Find the item in the items list
    for (var itemStock in items) {
      if (itemStock.item.name == itemName) {
        //if the name of the item exists and its in the stock.
        if (itemStock.isInStock()) {
          print(
              '$itemName is in stock at a price of \$${itemStock.item.price}.');
        } else {
          ////if the name of the item exists and its not in the stock.
          print('$itemName is out of stock.');
        }
        return;
      }
    }
    print(
        'Item $itemName: not found in the vending machine.'); //print this message for the item out of stock.
  }

  //  display the current stock of items
  void displayStock() {
    for (var itemStock in items) {
      print(
          '${itemStock.item.name}:\$${itemStock.item.price} (Stock:${itemStock.stock}) ');
    }
  }
}

void main() {
  // Create Item to test
  Item item = Item('Soda', 2.50);

  // Create ItemStock object
  ItemStock itemStock =
      ItemStock(item, 5); // Stock = 5, it's available, so will return true

  // Displaying item details (name and price)
  print(item.displayItem());

  // Checking if the item is available in the stock
  print(itemStock.isInStock());
  print("Welcome to the Vending Machine!");
  print("Items Available:");
  //////////////////////////
  VendingMachine machine = VendingMachine();

  // Create  items
  Item soda = Item('Soda', 2.50);
  Item chips = Item('Chips', 1.50);
  Item candy = Item('Candy', 1.00);

  // Adding items to the vending machine
  machine.addItem(soda, 10);
  machine.addItem(chips, 5);
  machine.addItem(candy, 0);

  // Display the current stock in the vending machine
  machine.displayStock();

  // Select an item
  machine.selectItem('Candy '); // Not found
  machine.selectItem('Soda'); // In stock
  machine.selectItem('Chips'); // In stock
}
