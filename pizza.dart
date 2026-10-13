import 'dart:io';

void main() {
  print('=' * 56);
  print('Pizza Price: "Small: 5 USD, Medium: 7 USD, Large: 10 USD"');

  String again = 'yes';

  // Loop allows continuous ordering until the user says no
  while (again == 'yes') {
    int price = 0;
    String size = '';

    // Input validation loop for pizza size
    while (price == 0) {
      stdout.write('Please enter your pizza size (small, medium, or large): ');
      size = (stdin.readLineSync() ?? '').trim().toLowerCase();

      switch (size) {
        case 'small':
          price = 5;
          break;
        case 'medium':
          price = 7;
          break;
        case 'large':
          price = 10;
          break;
        default:
          print('Invalid size. Please choose small, medium, or large.');
      }
    }

    // Input validation loop for quantity
    int quantity = 0;

    while (quantity <= 0) {
      stdout.write('How many pizzas do you want of $size?');
      quantity = int.tryParse((stdin.readLineSync() ?? '').trim()) ?? 0;

      if (quantity <= 0) {
        print('Invalid quantity. Please enter a whole number greater than 0.');
      }
    }

    // Calculate and display the total payment
    int total = price * quantity;
    print('Your Total Payment is: \$$total');

    // Validate the answer before continuing or exiting the loop
    do {
      stdout.write('Do you want to order again? (yes/no): ');
      again = (stdin.readLineSync() ?? '').trim().toLowerCase();

      if (again != 'yes' && again != 'no') {
        print('Invalid input. Please enter "yes" or "no".');
      }
    } while (again != 'yes' && again != 'no');
  }

  print('Thank you for your order! Have a great day!');
}
