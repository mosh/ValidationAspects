﻿namespace ValidationAspects;

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [AttributeUsage(AttributeTargets.Property)]
  ValidationMethodForPropertyAttribute = public class(ValidateBaseAttribute,IPropertyInterfaceDecorator, IPropertyImplementationDecorator)
  private
  protected
    method GetValidationMethod(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition):IMethod;
    begin
      var validationMethod:IMethod;

      var methods := aProperty.Owner.GetMethods(self.MethodName);

      for someMethod:IMethod in methods do
      begin

        if ((someMethod.ParameterCount=0) and (someMethod.Result.Fullname = typeof(System.Boolean).Fullname))then
        begin
          validationMethod := someMethod;
          break;
        end;

      end;

      if(not assigned(validationMethod))then
      begin
        Services.EmitError(string.Format('Unable to find the method {0} with no parameters and a return type of System.Boolean',self.MethodName));
      end;

      result:=validationMethod;

    end;

  public
    constructor (methodName:String;message:String);
    begin
      inherited constructor (message);
      self.MethodName := methodName;

    end;


    property MethodName:String;

    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition);
    begin

      var validationMethod := GetValidationMethod(Services, aProperty);

      if(assigned(validationMethod))then
      begin
        var ruleViolationType := Services.GetType('Validation.RuleViolation');

        var propertyName :=aProperty.Name;

        var newRuleViolation := new NewValue(ruleViolationType, [new DataValue(self.Message),new DataValue(propertyName)]);

        var yieldInstance := new YieldStatement(newRuleViolation);

        var stringIfStatement := new IfStatement(new BinaryValue(new ProcValue(new SelfValue, validationMethod), new DataValue(false),BinaryOperator.Equal), yieldInstance );

        self.AddStatementForRuleViolation(aProperty.Owner.Fullname, stringIfStatement);

      end;


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

        var validationMethod := GetValidationMethod (Services, aProperty);

        if(assigned(validationMethod))then
        begin

          var matchingPropertyAndCallingValidationMethod := new BinaryValue(new BinaryValue(compareProc, new DataValue(0), BinaryOperator.Equal),
                  new BinaryValue(new ProcValue(new SelfValue, validationMethod), new DataValue(false),BinaryOperator.Equal),
                  BinaryOperator.And);


          var ifStatement := new IfStatement(matchingPropertyAndCallingValidationMethod, new AssignmentStatement(new FieldValue(new SelfValue, itemValidationValue), new DataValue(self.Message)));

          (getter as IMethodDefinition).SetBody( Services, method
          begin
            unquote(ifStatement);
            Aspects.OriginalBody;
          end);
        end;
      end;

    end;

  end;

end.