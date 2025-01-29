let
    Source = Sql.Database("INPHTLN000431\MSSQLSERVER01", "AdventureWorksDW2022")
in
    Source

let
    Source = AdventureWorksDW2022,
    dbo_DimCustomer = Source{[Schema="dbo",Item="DimCustomer"]}[Data],
    #"Expanded DimGeography" = Table.ExpandRecordColumn(dbo_DimCustomer, "DimGeography", {"CountryRegionCode", "DimSalesTerritory"}, {"CountryRegionCode", "DimSalesTerritory"}),
    #"Expanded DimSalesTerritory" = Table.ExpandRecordColumn(#"Expanded DimGeography", "DimSalesTerritory", {"SalesTerritoryCountry"}, {"SalesTerritoryCountry"})
in
    #"Expanded DimSalesTerritory"

    