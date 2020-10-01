namespace ValidateTestConsoleApplication;

uses
  System.Collections.Generic,
  Validation;

type
  Employee = public class

  public
    property Id:Integer;
    property Firstname:String;
    property Lastname:String;
    property BirthDate:DateTime;
    property Salary:Decimal;

    method IsValid:Boolean;
    begin

      var result1 := GetRuleViolations.Count;
      // next line is the same as the above
      var result2 := System.Linq.Enumerable.Count<RuleViolation>(self.GetRuleViolations);

      result := (result1 = 0);

    end;

    method GetRuleViolations():IEnumerable<RuleViolation>; iterator;
    begin
      if(self.Id < 0 )then
      begin
        yield new RuleViolation('Id must have a value > -','Id');
      end;

      if(String.IsNullOrEmpty(self.Firstname))then
      begin
        yield new RuleViolation('Firstname is required', 'Firstname');
      end;

      if(String.IsNullOrEmpty(self.Lastname))then
      begin
        yield new RuleViolation('Lastname is required', 'Lastname');
      end;


    end;


    //method AnotherMethod:IEnumerable<RuleViolation>;
    //method CallingMethod:Integer;

  end;

end.