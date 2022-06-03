pageextension 50002 ExtendAssemblyOrder extends "Assembly Order"
{

    layout
    {


    }

    actions
    {
        addafter(Print)
        {
            action("Assembly Order")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Assembly Order';
                Promoted = true;
                PromotedIsBig = true;
                Image = AssemblyOrder;
                PromotedCategory = Process;
                RunObject = report "Assembly Order";
            }
        }
    }

    var
        myInt: Integer;





}