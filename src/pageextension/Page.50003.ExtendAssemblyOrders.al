pageextension 50003 ExtendAssemblyOrders extends "Assembly Orders"
{
    layout
    {


    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

    trigger OnAfterGetRecord()
    var
    begin
        //Rec.UpdateUnitCostValue(Rec."Document Type", Rec."No.")
    end;


}