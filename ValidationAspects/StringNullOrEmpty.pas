﻿namespace ValidationAspects;


uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [AttributeUsage(AttributeTargets.Property)]
  StringNullOrEmptyAttribute = public class(ValidateBaseAttribute,IPropertyInterfaceDecorator,IPropertyImplementationDecorator)
  private
  protected
  public
    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition);
    begin
      var ruleViolationType := Services.GetType('Validation.RuleViolation');

      var errorMessage :=String.Format('{0} must have a value with length',aProperty.Name);
      var propertyName :=aProperty.Name;

      var newRuleViolation := new NewValue(ruleViolationType, [new DataValue(errorMessage),new DataValue(propertyName)]);


      var stringType:=Services.FindType('System.String');

      var IsNullOrEmptyProc:= new ProcValue(new TypeValue(stringType),
        'IsNullOrEmpty', [aProperty.ReadExpression]);

      var yieldInstance := new YieldStatement(newRuleViolation);

      var stringIfStatement := new IfStatement(IsNullOrEmptyProc, yieldInstance );

      self.AddStatementForRuleViolation(aProperty.Owner.Fullname, stringIfStatement);



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


        var matchingPropertyAndIsNullOrEmpty := new BinaryValue(new BinaryValue(compareProc, new DataValue(0), BinaryOperator.Equal),
                new BinaryValue(new ProcValue(new TypeValue(Services.FindType('System.String')), 'IsNullOrEmpty', [aProperty.ReadExpression]), new DataValue(true), BinaryOperator.Equal),
                BinaryOperator.And);


        var ifStatement := new IfStatement(matchingPropertyAndIsNullOrEmpty, new AssignmentStatement(new FieldValue(new SelfValue, itemValidationValue), new DataValue(self.Message)));

        (getter as IMethodDefinition).SetBody( Services, method
        begin
          unquote(ifStatement);
          Aspects.OriginalBody;
        end);

      end;

    end;

  end;


end.