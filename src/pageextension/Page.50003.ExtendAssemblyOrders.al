pageextension 50003 ExtendAssemblyOrders extends "Assembly Orders"
{
    layout
    {
        modify("Unit Cost")
        {
            ApplicationArea = All;
            trigger OnAfterValidate()
            begin
                CurrPage.Update(false);
            end;
        }

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
        Rec.UpdateUnitCostValue(Rec."Document Type", Rec."No.")
    end;


}