let
    Source = Dates,
    TrailingTenYearsFromToday = 
        Table.SelectRows(
            Source,
            each
                [FullDateAlternativeKey] <= DateTime.Date(Date-Time.Date.LocalNow()) and
                [CalendarYear] >= Date.Year(DateTime.LocalNow()) - 10
                
        )
in
    TrailingTenYearsFromToday
  

