pageextension 50006 "PurchaseOrderList_Ext" extends "Purchase Order List"
{
    layout
    {
        addafter(Amount)
        {
            field(Amountinvoiced; Amountinvoiced)
            {
                ApplicationArea = All;
                Caption = 'Amount invoiced';
            }
            field(AmountRemaining; AmountRemaining)
            {
                ApplicationArea = All;
                Caption = 'Amount Remaining';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        PurchaseLine_L: Record "Purchase Line";
    begin
        Amountinvoiced := 0;
        AmountRemaining := 0;
        PurchaseLine_L.Reset();
        PurchaseLine_L.SetRange("Document Type", Rec."Document Type");
        PurchaseLine_L.SetRange("Document No.", Rec."No.");
        If PurchaseLine_L.FindSet() then
            repeat
                Amountinvoiced += PurchaseLine_L."Quantity Invoiced" * PurchaseLine_L."Direct Unit Cost";
            until PurchaseLine_L.Next() = 0;
        AmountRemaining := Rec.Amount - Amountinvoiced;
    end;

    var
        Amountinvoiced: Decimal;
        AmountRemaining: Decimal;
}