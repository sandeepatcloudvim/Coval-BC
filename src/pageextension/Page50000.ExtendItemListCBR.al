pageextension 50000 ExtendItemList extends "Item List"
{

    layout
    {
        addafter(InventoryField)
        {
            field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Assembly Order"; Rec."Qty. on Assembly Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Asm. Component"; Rec."Qty. on Asm. Component")
            {
                ApplicationArea = All;
            }
            field("Qty. Avail"; AvailableQty)
            {
                ApplicationArea = All;
                Caption = 'Qty Available';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        AvailableQty: Decimal;


    trigger OnAfterGetRecord()
    var
    begin
        Clear(AvailableQty);
        Rec.CalcFields("Qty. on Sales Order", Inventory, "Qty. on Assembly Order", "Qty. on Asm. Component");
        AvailableQty := (Rec.Inventory - Rec."Qty. on Sales Order" - Rec."Qty. on Asm. Component" + Rec."Qty. on Prod. Order" + Rec."Qty. on Assembly Order");
    end;
}