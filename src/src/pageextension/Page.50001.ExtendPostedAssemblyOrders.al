pageextension 50001 CBR_ExtendPostedAssemblyOrders extends "Posted Assembly Orders"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Print)
        {
            action("Assembly Variance")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Assembly Variance';
                Promoted = true;
                PromotedIsBig = true;
                Image = AssemblyOrder;
                PromotedCategory = Process;
                RunObject = page "Assembly Variance";
            }

        }
    }

    var
        myInt: Integer;
}