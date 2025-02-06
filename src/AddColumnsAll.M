

let
    Source = AdventureWorksDW2022,
    dbo_DimCustomer = Source{[Schema="dbo",Item="DimCustomer"]}[Data],
    CurrentDate = DateTime.Date(DateTime.LocalNow()),
    CurrentYear = Date.Year(CurrentDate),
    CurrentMonth = Date.Month(CurrentDate),
    CurrentDay = Date.Day(CurrentDate),
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
                    & Text.Range([MiddleName], 0, 1) & ". " & [LastName]
    ),

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
    ),
 
CustomerAge =
    Table.AddColumn(
        AddCustomerDay, "Customer Age" each
        if [Customer Month] < CurrentMonth
            then CurrentYear - [Customer Year]
        else if [Customer Month] > CustomerMonth 
            then CurrentYear - [Customer Year] - 1
        else if [Customer Day] < CurrentDay
            then CurrentYear - [Current Year]
        else CurrentYear - [Customer Year] - 1
    ),

CustomerSegment = 
    Table.AddColumn(
        CustomerAge, "Customer Age Segment", each
        if [CustomerAge] < 30 then "Less than 30"
        else if [CustomerAge] < 40 then "30 to 39"
        else if [CustomerAge] < 50 then "40 to 59"
        else if [CustomerAge] < 60 then "50 to 69"
        else "60 and older"
    )
in
    CustomerSegment


    