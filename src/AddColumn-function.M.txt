
AddCustomerYear = 
    Table.AddColumn(
        NameFormatTable, "Customer Year", each Date.Year({BirthDate]),
        Int64.Type     
    )
CustomerAge = 
    Table.AddColumn(
        AddCustomerDay, "Customer Age", each
        if [Customer Month] < CurrentMonth
            then CurrentYear - [Current Year]
        else if [Current Month] > CurrentMonth
            then CurrentYear - [CurrentYear] - 1
        else if [CurrentDay] < CurrentDay
            

    )