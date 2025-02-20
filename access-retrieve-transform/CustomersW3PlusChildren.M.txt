
let
    Source = Customers,
    ThreePlusChildFamilies = Table.SelectRows( 
        Source, each [CountryRegionCode] >=3
       )
in
    ThreePlusChildFamilies
  

