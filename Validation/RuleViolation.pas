namespace Validation;

uses
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  RuleViolation = public class
  public

    constructor (errorMessage:String);
    begin
      self.ErrorMessage:=errorMessage;
    end;

    constructor (errorMessage:String; propertyName:String);
    begin
      self.ErrorMessage:=errorMessage;
      self.PropertyName:=propertyName;
    end;


    property ErrorMessage:String read private write;
    property PropertyName:String read private write;


  end;

end.