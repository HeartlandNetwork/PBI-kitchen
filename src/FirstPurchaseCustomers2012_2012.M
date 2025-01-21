let
    Source = Customers,
    BetweenDates = 
        Table.SelectRows( 
            Source, 
            each [DateFirstPurchase] >= #date(2012,01,01) and
                 [DateFirstPurchase] >= #date(2013,12,31)
       )
in
    BetweenDates
  

