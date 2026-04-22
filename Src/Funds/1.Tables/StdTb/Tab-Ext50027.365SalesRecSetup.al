namespace Chapel.Chapel;

using Microsoft.Sales.Setup;
using Microsoft.Foundation.NoSeries;

tableextension 50027 "365 Sales & Rec. Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "Benficiary No."; Code[20])
        {
            Caption = 'Benficiary No.';
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50001; "Guardian No."; Code[20])
        {
            Caption = 'Guardian No.';
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50002; "Scholarship No."; Code[20])
        {
            Caption = 'Scholarship No.';
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50003; "Sponsor No."; Code[20])
        {
            Caption = 'Sponsor No.';
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50004; "Activity No."; Code[20])
        {
            Caption = 'Activity No.';
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
    }
}
