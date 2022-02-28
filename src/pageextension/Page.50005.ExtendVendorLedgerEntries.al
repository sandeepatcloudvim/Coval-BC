pageextension 50005 MyExtension extends "Vendor Ledger Entries"
{
    layout
    {
        addafter("Vendor No.")
        {
            field("VendorName"; Rec."Vendor Name")
            {
                ApplicationArea = All;
                Caption = 'Vendor Name';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}