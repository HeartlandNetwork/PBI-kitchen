let
    Source = Customers,
    MissingTitleorMiddleName = Table.SelectRows( 
        Source, each [MiddleName] = null or [Title] = null
       )
in
    MissingTitleorMiddleName
  

