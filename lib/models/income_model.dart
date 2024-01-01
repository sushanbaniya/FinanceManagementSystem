class IncomeModel {
  var id;
  var incomeSource;
  int incomeAmount = 0;

  IncomeModel({var rId, var rIncomeSource, required int rIncomeAmount}) {
    this.id = rId;
    this.incomeSource = rIncomeSource;
    this.incomeAmount = rIncomeAmount;
  }
}