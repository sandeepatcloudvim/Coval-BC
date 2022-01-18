tableextension 50001 ExtendAssemblyHeader extends "Assembly Header"
{
    fields
    {

    }

    var
        myInt: Integer;

    procedure UpdateUnitCostValue(DocType: Enum "Assembly Document Type"; DocNo: Code[20])
    var
        recAssemblyLine: Record "Assembly Line";
        TotalUnitCost: Decimal;
    begin
        Clear(TotalUnitCost);
        recAssemblyLine.Reset();
        recAssemblyLine.SetRange("Document Type", DocType);
        recAssemblyLine.SetRange("Document No.", DocNo);
        if recAssemblyLine.FindSet()
        then
            repeat
                TotalUnitCost := TotalUnitCost + (recAssemblyLine."Quantity to Consume" * recAssemblyLine."Unit Cost");
            until recAssemblyLine.Next() = 0;

        Rec.validate("Unit Cost", TotalUnitCost);
        Rec.Modify();
    end;

}