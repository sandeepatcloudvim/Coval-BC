codeunit 50000 EventSubcriber_Coval
{
    Permissions = tabledata 17 = rimd, tabledata 25 = rimd;


    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Customer Statements" then
            NewReportId := Report::"Customer Statements CBR";
    end;

}