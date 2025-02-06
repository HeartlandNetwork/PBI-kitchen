
AddCustomerYear = 
    Table.AddColumn(
        NameFormatTable, "Customer Year", each Date.Year({BirthDate]),
        Int64.Type     
    ),
AddCustomerMonth =
    Table.AddColumn(
        AddCustomerYear, "Customer Month", each Date.Month([BirthDate]),
        Int64.Type
    ),
AddCustomerDay =
    Table.AddColumn(
        AddCustomerMonth, "Customer Day", each Date.Day([BirthDate]),
        Int64.Type
    )
