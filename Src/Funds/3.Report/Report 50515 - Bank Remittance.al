report 50515 "Bank Remittance"
{
    DefaultRenderingLayout = NCBA;
    ApplicationArea = All;

    dataset
    {
        dataitem("Payment Line"; "Payment Line")
        {
            RequestFilterFields = "Paying Bank", "Document No.", "Document Type", "Payment Code", "Posting Date", "Status", "Payee Type", "Payee No.";
            column(LineNo_PaymentLine; "Line No.")
            {
            }
            column(DocumentNo_PaymentLine; "Document No.")
            {
            }
            column(DocumentType_PaymentLine; "Document Type")
            {
            }
            column(PaymentCode_PaymentLine; "Payment Code")
            {
            }
            column(PaymentCodeDescription_PaymentLine; "Payment Code Description")
            {
            }
            column(AccountType_PaymentLine; "Account Type")
            {
            }
            column(AccountNo_PaymentLine; "Account No.")
            {
            }
            column(AccountName_PaymentLine; "Account Name")
            {
            }
            column(PostingGroup_PaymentLine; "Posting Group")
            {
            }
            column(Description_PaymentLine; DescriptionPayment)
            {
            }
            column(ReferenceNo_PaymentLine; "Reference No.")
            {
            }
            column(PostingDate_PaymentLine; PostingDate)
            {
            }
            column(CurrencyCode_PaymentLine; "Currency Code")
            {
            }
            column(CurrencyFactor_PaymentLine; "Currency Factor")
            {
            }
            column(TotalAmount_PaymentLine; "Total Amount")
            {
            }
            column(TotalAmountLCY_PaymentLine; "Total Amount(LCY)")
            {
            }
            column(VATCode_PaymentLine; "VAT Code")
            {
            }
            column(VATAmount_PaymentLine; "VAT Amount")
            {
            }
            column(VATAmountLCY_PaymentLine; "VAT Amount(LCY)")
            {
            }
            column(WithholdingTaxCode_PaymentLine; "Withholding Tax Code")
            {
            }
            column(WithholdingTaxAmount_PaymentLine; "Withholding Tax Amount")
            {
            }
            column(WithholdingTaxAmountLCY_PaymentLine; "Withholding Tax Amount(LCY)")
            {
            }
            column(WithholdingVATCode_PaymentLine; "Withholding VAT Code")
            {
            }
            column(WithholdingVATAmount_PaymentLine; "Withholding VAT Amount")
            {
            }
            column(WithholdingVATAmountLCY_PaymentLine; "Withholding VAT Amount(LCY)")
            {
            }
            column(NetAmount_PaymentLine; "Net Amount")
            {
            }
            column(NetAmountLCY_PaymentLine; "Net Amount(LCY)")
            {
            }
            column(AppliestoDocType_PaymentLine; "Applies-to Doc. Type")
            {
            }
            column(AppliestoDocNo_PaymentLine; "Applies-to Doc. No.")
            {
            }
            column(AppliestoID_PaymentLine; "Applies-to ID")
            {
            }
            column(Committed_PaymentLine; Committed)
            {
            }
            column(BudgetCode_PaymentLine; "Budget Code")
            {
            }
            column(PayeeType_PaymentLine; "Payee Type")
            {
            }
            column(PayeeNo_PaymentLine; "Payee No.")
            {
            }
            column(VendorInvoiceNo_PaymentLine; "Vendor Invoice No.")
            {
            }
            column(InvoiceDate_PaymentLine; "Invoice Date")
            {
            }
            column(TaxAmount_PaymentLine; "Tax Amount")
            {
            }
            column(TaxAmountLCY_PaymentLine; "Tax Amount (LCY)")
            {
            }
            column(GlobalDimension1Code_PaymentLine; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_PaymentLine; "Global Dimension 2 Code")
            {
            }
            column(ShortcutDimension3Code_PaymentLine; "Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code_PaymentLine; "Shortcut Dimension 4 Code")
            {
            }
            column(ShortcutDimension5Code_PaymentLine; "Shortcut Dimension 5 Code")
            {
            }
            column(ShortcutDimension6Code_PaymentLine; "Shortcut Dimension 6 Code")
            {
            }
            column(ShortcutDimension7Code_PaymentLine; "Shortcut Dimension 7 Code")
            {
            }
            column(ShortcutDimension8Code_PaymentLine; "Shortcut Dimension 8 Code")
            {
            }
            column(ResponsibilityCenter_PaymentLine; "Responsibility Center")
            {
            }
            column(PayeeBankCode_PaymentLine; "Payee Bank Code")
            {
            }
            column(PayeeBankName_PaymentLine; "Payee Bank Name")
            {
            }
            column(PayeeBankBranchCode_PaymentLine; "Payee Bank Branch Code")
            {
            }
            column(PayeeBankBranchName_PaymentLine; "Payee Bank Branch Name")
            {
            }
            column(PayeeBankAccountNo_PaymentLine; "Payee Bank Account No.")
            {
            }
            column(MobilePaymentAccountNo_PaymentLine; "Mobile Payment Account No.")
            {
            }
            column(PaymentType_PaymentLine; "Payment Type")
            {
            }
            column(Status_PaymentLine; Status)
            {
            }
            column(Posted_PaymentLine; Posted)
            {
            }
            column(PostedBy_PaymentLine; "Posted By")
            {
            }
            column(DatePosted_PaymentLine; "Date Posted")
            {
            }
            column(TimePosted_PaymentLine; "Time Posted")
            {
            }
            column(Reversed_PaymentLine; Reversed)
            {
            }
            column(ReversedBy_PaymentLine; "Reversed By")
            {
            }
            column(ReversalDate_PaymentLine; "Reversal Date")
            {
            }
            column(ReversalTime_PaymentLine; "Reversal Time")
            {
            }
            column(JobNo_PaymentLine; "Job No.")
            {
            }
            column(EmployeeTransactionType_PaymentLine; "Employee Transaction Type")
            {
            }
            column(PhoneNo_PaymentLine; "Phone No.")
            {
            }
            column(InvoiceAmount_PaymentLine; "Invoice Amount")
            {
            }
            column(ChequeNo_PaymentLine; "Cheque No.")
            {
            }
            column(SCLineNo_PaymentLine; "SC Line No.")
            {
            }
            column(InvoiceNo_PaymentLine; "Invoice No.")
            {
            }
            column(RecipientBankCode; RecipientBankCode)
            {
            }
            column(RecipientBankBranchCode; RecipientBankBranchCode)
            {
            }
            column(PhoneDetails; PhoneDetails)
            {
            }


            trigger OnAfterGetRecord()
            begin
                RecipientBankCode := '';
                recipientBankBranchCode := '';
                phoneDetails := '';
                PostingDate := today;

                if vendorList.Get("Payee No.") then begin
                    RecipientBankCode := vendorList."Bank Code";
                    recipientBankBranchCode := vendorList."Bank Branch Code";
                    phoneDetails := vendorList."Phone No.";
                    if "Payment Line"."Payee Bank Account No." = '' then
                        "Payment Line"."Payee Bank Account No." := vendorList."Bank Account No.";
                    if "Payment Line"."Payee Bank Branch Code" = '' then
                        "Payment Line"."Payee Bank Branch Code" := vendorList."Bank Branch Code";
                    if "Payment Line"."Payee Bank Code" = '' then
                        "Payment Line"."Payee Bank Code" := vendorList."Bank Code";
                    "Payment Line".Modify();
                    RecipientBankCode := vendorList."Bank Code";
                    recipientBankBranchCode := vendorList."Bank Branch Code";
                    phoneDetails := vendorList."Phone No.";
                end;

                if EmployeeList.Get("Account No.") then begin
                    // RecipientBankCode := EmployeeList."Bank Code";
                    //recipientBankBranchCode := EmployeeList."Bank Branch Code";
                    phoneDetails := EmployeeList."Phone No.";
                end;

                DescriptionPayment := '';
                purchInvoiceHeader.Reset();
                purchInvoiceHeader.SetRange("No.", "Payment Line"."Invoice No.");
                if purchInvoiceHeader.FindFirst() then begin
                    DescriptionPayment := purchInvoiceHeader."Posting Description";
                end;

                ImprestHeader.Reset();
                ImprestHeader.SetRange("No.", "Payment Line"."Payee No.");
                if ImprestHeader.FindFirst() then begin
                    DescriptionPayment := ImprestHeader.Description;
                end;

                if DescriptionPayment = '' then begin
                    DescriptionPayment := "Payment Line".Description;
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    rendering
    {
        layout(NCBA)
        {
            Caption = 'NCBA Bulk EFT';
            LayoutFile = 'src/Funds/12.layout/Bank Remitance-NCBA Bank EFT.rdl';
            Type = RDLC;
        }
        layout(Layout1)
        {
            Caption = 'SBM SPS Bulk';
            LayoutFile = 'src/Funds/12.layout/Bank Remitance-SBM SPS Bulk.rdl';
            Type = RDLC;
        }
        layout(Layout2)
        {
            Caption = 'SBM Bank EFT';
            LayoutFile = 'src/Funds/12.layout/Bank Remitance-SBM Bank EFT.rdl';
            Type = RDLC;
        }
        layout(Layout3)
        {
            Caption = 'SBM Bank EFT To Other Banks';
            LayoutFile = 'src/Funds/12.layout/Bank Remitance-SBM Bank EFT To Other Banks.rdl';
            Type = RDLC;
        }
        layout(Layout4)
        {
            Caption = 'NCBA Bulk MPESA';
            LayoutFile = 'src/Funds/12.layout/Bank Remitance-NCBA Bank MPESA.rdl';
            Type = RDLC;
        }
    }

    var
        StartDate: Date;
        EndDate: Date;
        PAYEENAME: Text;
        REFFERENCENUMBER: Code[30];
        BANKNAME: Text;
        PhoneDetails: code[50];
        BankAccount: Record "Bank Account";
        PaymentHeader: Record "Payment Header";
        ReceiptHeader: Record "Receipt Header";
        VendorList: record "Vendor";
        EmployeeList: record "Employee";
        CustomerList: record "Customer";
        RecipientBankCode: code[20];
        RecipientBankBranchCode: code[20];
        PostingDate: Date;
        DescriptionPayment: text[250];
        purchInvoiceHeader: Record "Purch. Inv. Header";
        ImprestHeader: record "Imprest Header";
}

