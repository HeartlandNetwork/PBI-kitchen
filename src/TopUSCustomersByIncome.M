

let
    Source = #"United States Customers",
    SortedByIncome = 
        Table.Sort(
            Source,
            {{"YearlyIncome", Order.Descending}}
        ),
    TopUSIncomeCustomers = Table.FirstN(SortedByIncome, 100
    )
in
    USCustomers
  



    