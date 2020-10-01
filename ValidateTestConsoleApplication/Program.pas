namespace ValidateTestConsoleApplication;

uses
  System.Collections.Generic,
  System.Linq, Validation;


type


  ConsoleApp = class
  public
    class method Main;
    begin
      var newEmployee:=new Employee;

      if(newEmployee.IsValid)then
      begin
        Console.WriteLine('Valid');
      end
      else
      begin
        Console.WriteLine('Not valid');

        for violation in newEmployee.GetRuleViolations do
        begin
          Console.WriteLine('Violation {0}',violation.ErrorMessage);
        end;

      end;

      var anotherEmployee:= new Employee( Id := 1, Firstname:= 'John', Lastname:='Moshakis');

      if(anotherEmployee.GetRuleViolations.Count=0)then
      begin
        Console.WriteLine('Yes anotherEmployee is valid');
      end
      else
      begin
        Console.WriteLine('No anotherEmployee should be valid');

        for violation in anotherEmployee.GetRuleViolations do
        begin
          Console.WriteLine('anotherEmployee Violation {0}',violation.ErrorMessage);
        end;
      end;

    end;

  end;



end.