let
    Source = Customers,
    MgmtAndFemalesOrBachelors = 
        Table.SelectRows( 
            Source, 
            each [EnglishOccupation] = "Management" and
            ([Gender] = "F" or [EnglishEducation] = "Bachelors")
       )
in
    MgmtAndFemalesOrBachelors
  

