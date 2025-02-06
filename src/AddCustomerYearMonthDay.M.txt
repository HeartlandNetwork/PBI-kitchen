
    AddCustomerYear = Table.AddColumn(
        NameFormatTable, "Customer Year", each Date.Year([BirthDate]), 
        Int64.Type
    ),
    AddCustomerMonth = Table.AddColumn(
        NameFormatTable, "Customer Month", each Date.Month([BirthDate]), 
        Int64.Type
    ),
    AddCustomerDay = Table.AddColumn(
        NameFormatTable, "Customer Day", each Date.Month([BirthDate]), 
        Int64.Type
    )