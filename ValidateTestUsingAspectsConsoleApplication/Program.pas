namespace ValidateTestUsingAspectsConsoleApplication;

interface

uses
  System.Linq,
  ValidationDomain;

type
 
  ConsoleApp = class
  public
    class method Main;
  end;

implementation

class method ConsoleApp.Main;
begin

  var newEmployee:=new Employee;

  if(not newEmployee.IsValid)then
  begin
    Console.WriteLine('Not Valid');

    for violation in newEmployee.GetRuleViolations do
    begin
      Console.WriteLine('newEmployee Violation {0}',violation.ErrorMessage); 
    end;
  end
  else
  begin
    Console.WriteLine('Valid');
  end;

  var anotherEmployee:= new Employee( Id := 1, Firstname:= 'John', Lastname:='Moshakis', SomeNumber := 7, SomeDoubleNumber := 5.7);

  if(anotherEmployee.IsValid)then
  begin
    // this is where we should be if the aspect worked
    Console.WriteLine('Yes anotherEmployee is valid');
  end
  else
  begin
    // we shoudn't be here
    Console.WriteLine('No anotherEmployee should be valid');

    for violation in anotherEmployee.GetRuleViolations do
    begin
      Console.WriteLine('anotherEmployee Violation {0}',violation.ErrorMessage); 
    end;
  end;
end;

end.