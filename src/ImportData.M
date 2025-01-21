

let
    Source = AdventureWorksDW2022,
    dbo_DimOrganization = Source{[Schema="dbo",Item="DimOrganization"]}[Data],
    #"Sorted Rows" = Table.Sort(
        dbo_DimOrganization,
        {{"CurrencyKey", Order.Descending}, {"OrganizationKey", Order.Ascending}}),
    #"Added Index" = Table.AddIndexColumn(#"Sorted Rows", "Index", 1, 1, Int64.Type),
    #"Removed Other Columns" = Table.SelectColumns(
        #"Added Index",
        {"ParentOrganizationKey", "OrganizationName", "FactFinance", "Index"}),
    #"Expanded FactFinance" = Table.ExpandTableColumn(
        #"Removed Other Columns", 
        "FactFinance", 
        {"Amount"}, 
        {"Amount"}),
    #"Grouped Rows" = Table.Group(
        #"Expanded FactFinance", 
        {"ParentOrganizationKey", "OrganizationName", "Index"},
        {{"Amount", each List.Sum([Amount]), type nullable number}})
in
    #"Grouped Rows"



    