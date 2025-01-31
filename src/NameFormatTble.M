

NameFormatTble = 
    Table.AddColumn(
        #"Removed Other Columns", "Formatted Name", each
            if [Title] = null and [MiddleName] = null 
                then [FirstName] & " " & [LastName]
            else if [Title] = null 
                then [FirstName] & " " & Text.Range([MiddleName], 0, 1)
                    & ", " & [LastName]
            else
                [Title] & " " & [FirstName] & " "
                    & Text.Range([MiddleName]), 0, 1) & ". " & [LastName]
    )
    