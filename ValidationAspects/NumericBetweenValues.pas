namespace ValidationAspects;

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [AttributeUsage(AttributeTargets.Property)]
  NumericBetweenValuesAttribute<T> = public class(ValidateBaseAttribute,IPropertyInterfaceDecorator, IPropertyImplementationDecorator)
  private

  protected

  public
    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition);
    begin

      // validation failure
      var ruleViolationType := Services.GetType('Validation.RuleViolation');

      var errorMessage := String.Format('{0} is outside the allowed range ',aProperty.Name);

      var newRuleViolation := new NewValue(ruleViolationType, [new DataValue(errorMessage),new DataValue(aProperty.Name)]);

      var yieldInstance := new YieldStatement(newRuleViolation);

      var failedValidationIf := new IfStatement(
                          new BinaryValue(new BinaryValue(aProperty.ReadExpression, new DataValue(self.BottomValue), BinaryOperator.Less),
                          new BinaryValue(aProperty.ReadExpression, new DataValue(self.TopValue), BinaryOperator.Greater),BinaryOperator.Or),
                          yieldInstance);



      self.AddStatementForRuleViolation(aProperty.Owner.Fullname, failedValidationIf);


    end;

    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);
    begin

      var methods:Array of IMethod := aProperty.Owner.GetMethods('get_Item');

      if(methods.length>0)then
      begin
        var getter := methods[0];

        var itemValidationValue := (getter as IMethodDefinition).Owner.GetField('itemValidationValue');

        var compareProc := new ProcValue(new TypeValue(Services.FindType('System.String')), 'Compare',
          [new DataValue(aProperty.Name), new ParamValue(0)]);




        var failedValidationIf := new IfStatement(
              new BinaryValue(new BinaryValue(compareProc, new DataValue(0), BinaryOperator.Equal),
                          new BinaryValue(new BinaryValue(aProperty.ReadExpression, new DataValue(self.BottomValue), BinaryOperator.Less),
                          new BinaryValue(aProperty.ReadExpression, new DataValue(self.TopValue), BinaryOperator.Greater),BinaryOperator.Or), BinaryOperator.And),
                          new AssignmentStatement(new FieldValue(new SelfValue, itemValidationValue), new DataValue(self.Message)));


        (getter as IMethodDefinition).SetBody( Services, method
        begin
          unquote(failedValidationIf);
          Aspects.OriginalBody;
        end);

      end;

    end;


    constructor (bottomValue:T; topValue:T; message:String);
    begin
      inherited constructor (message);

      self.BottomValue := bottomValue;
      self.TopValue := topValue;

    end;


    property BottomValue:T;
    property TopValue:T;

  end;

  Int32BetweenValuesAttribute = public class(NumericBetweenValuesAttribute<Int32>)

  private
  public

  end;

  Int64BetweenValuesAttribute = public class(NumericBetweenValuesAttribute<Int64>)

  private
  public

  end;

  DoubleBetweenValuesAttribute = public class(NumericBetweenValuesAttribute<System.Double>)
  private
  public

  end;



end.