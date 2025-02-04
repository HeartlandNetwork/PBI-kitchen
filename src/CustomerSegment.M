

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

    