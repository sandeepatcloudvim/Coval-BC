reportextension 50004 ExtendAssemblyOrder_CBR extends "Assembly Order"
{
    dataset
    {
        add("Assembly Header")
        {
            column(LotNoValue; LotNoValue)
            {

            }
        }
        modify("Assembly Header")
        {
            trigger OnAfterAfterGetRecord()
            begin
                Clear(LotNoValue);
                ReservEntry.Reset;
                ReservEntry.SetRange("Source ID", "Assembly Header"."No.");
                ReservEntry.SetRange("Item No.", "Assembly Header"."Item No.");
                if ReservEntry.FindFirst() then begin
                    LotNoValue := ReservEntry."Lot No.";
                end;

                TracSpec.Reset;
                TracSpec.SetRange("Source ID", "Assembly Header"."No.");
                TracSpec.SetRange("Item No.", "Assembly Header"."Item No.");
                if TracSpec.FindFirst() then begin
                    LotNoValue := TracSpec."Lot No.";
                end;
            end;
        }
    }

    requestpage
    {
        // Add changes to the requestpage here
    }
    labels
    {
        LotNoCaption = 'Lot Number';
    }
    var
        ReservEntry: Record "Reservation Entry";
        TracSpec: Record "Tracking Specification";
        LotNoValue: Code[20];
}