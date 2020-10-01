namespace ValidationDomain;

uses
  Validation,
  ValidationAspects;

type

  [aspect:Validation]
  Employee=public class

  private
    method ValidateBirthDate:Boolean;
    begin
      result:= assigned(self.BirthDate) and (DateTime.Compare(self.BirthDate, new DateTime(1970, 1,1))>0);
    end;


  public
    [aspect:NumericHasValue('An Id is Required')]
    property Id:Integer;
    [aspect:StringNullOrEmpty('Must have a value')]
    property Firstname:String;
    [aspect:StringNullOrEmpty('Must have a value')]
    property Lastname:String;
    [aspect:ValidationMethodForProperty('ValidateBirthDate','The date of birth must be valid')]
    property BirthDate:DateTime;
    property Salary:Decimal;

    [aspect:Int32BetweenValues(5,10,'Must been between ranges')]
    property SomeNumber:Int32;


    [aspect:ValidationMethod('We are not paying this employee')]
    method IsSalaryValid():Boolean;
    begin
      var value:Decimal := 5.5;
      result := (Salary > 0);
    end;


    [aspect:DoubleBetweenValues(5.5, 5.9,'Must been between ranges')]
    property SomeDoubleNumber:Double;

    [aspect:Int64BetweenValues(100,200,'Must been between ranges')]
    property SomeInt64Number:Int64;
  end;


end.