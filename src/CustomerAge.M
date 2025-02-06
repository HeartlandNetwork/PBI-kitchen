
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
    )

    