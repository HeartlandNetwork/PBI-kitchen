

let
    Source = Customers,
    USCustomers = Table.SelectRows(
        Source, each [CountryRegionCode] = "US"
    )
in
    USCustomers
  



    