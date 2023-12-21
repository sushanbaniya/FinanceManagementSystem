class Expense {
  var id;
  var title;
  var price;

  Expense({var id , var title, var price}) {
    id = DateTime.now().toString();
    title = title;
    price = price;
  }
}