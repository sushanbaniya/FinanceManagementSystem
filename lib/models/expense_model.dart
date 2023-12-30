class ExpenseModel {
  var id;
  var title;
  int price = 0;

  ExpenseModel({ var id ,  var Rtitle, required int Rprice}) {
    this.id = DateTime.now().toString();
    this.title = Rtitle;
    this.price = Rprice;
    
    // print(title + price + id);
  }

 

}