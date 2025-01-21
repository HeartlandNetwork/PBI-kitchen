let
    Source = Customers,
    SalesTerritoryCountryList = List.Distinct(Source[SalesTerritoryCountry]),
    OrderedList = List.Sort(SalesTerritoryCountryList, Order.Ascending)
in
    OrderedList
  

