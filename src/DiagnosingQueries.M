let
    Source = AdventureWorksDW2022,
    dbo_FactCurrencyRate = Source{[Schema="dbo",Item="FactCurrencyRate"]}[Data],
    Sort = Table.Sort(
            dbo_FactCurrencyRate,
            {{"CurrencyKey", Order.Ascending}, {"DateKey", Order.Ascending}}
        ),
    Index = Table.TransformColumnTypes(
                Table.AddIndexColumn(Sort, "Row Index", 1, 1),
                {{ "Row Index", Int64.Type }}
            ),
    PrevIndex = Table.TransformColumnTypes(
                    Table.AddIndexColumn(Index, "Prev Index", 0, 1),
                    {{ "Prev Index", Int64.Type }}
                ),
    SelfJoin = Table.NestedJoin(
                    PrevIndex, {"Prev Index"}, PrevIndex, {"Row Index"}, 
                    "NewColumn", JoinKind.LeftOuter
                ),
    PrevColumns = Table.ExpandTableColumn(
                    SelfJoin, "NewColumn", 
                    {"EndOfDayRate", "CurrencyKey"}, {"PrevRate", "PrevKey"}
                  ),
    AddChange = Table.AddColumn(
                    PrevColumns, "Daily Change", each
                    if [CurrencyKey] = [PrevKey] then [EndOfDayRate] - [PrevRate]
                    else null, type number
                ),
    SelectColumns = Table.SelectColumns(
                        AddChange,
                        {"CurrencyKey", "EndOfDayRate", "Date", "Daily Change"}
                    )
in
    SelectColumns