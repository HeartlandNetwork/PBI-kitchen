let
    Source = Dates,
    TrailingTenYearsFromToday = 
        Table.SelectRows(
            Source,
            each
                [FullDateAlternateKey] <= DateTime.Date(DateTime.LocalNow()) and
                [CalendarYear] >= Date.Year(DateTime.LocalNow()) - 15
                
        )
in
    TrailingTenYearsFromToday
  

