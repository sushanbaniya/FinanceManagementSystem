class ExpenseModel {
  var id;
  var title;
  var price;

  ExpenseModel({var id , var Rtitle, var Rprice}) {
    id = DateTime.now().toString();
    title = Rtitle;
    price = Rprice;
    
    // print(title + price + id);
  }
}