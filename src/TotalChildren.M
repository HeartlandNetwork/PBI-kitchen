

let
    Source = Customers, 
    ThreeChildrenFamilies = Table.SelectRows(
        Source, each [TotalChildren] >=3
    )
in
    ThreeChildrenFamilies



    