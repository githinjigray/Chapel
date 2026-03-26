namespace Chapel.Chapel;

using Microsoft.Finance.GeneralLedger.Budget;

pageextension 58001 "365 G/L Budget Entries" extends "G/L Budget Entries"
{
    layout
    {
        addafter(Amount)
        {

           
        }
    }
}
