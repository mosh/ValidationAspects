namespace ValidationAspects;

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  ValidateBaseAttribute = public class(Attribute)
  private
  protected
    method AddStatementForIDataErrorInfo(fullName:String; propertyName:String; someStatement:Statement);
    begin
      var statementsByPropertyName : List<StatementGrouping>;
      var matchingGrouping:StatementGrouping;

      if(not StatementStorage.StatementsForIDataErrorInfo.TryGetValue(fullName,out statementsByPropertyName))then
      begin
        statementsByPropertyName:= new List<StatementGrouping>;
        StatementStorage.StatementsForIDataErrorInfo.Add(fullname, statementsByPropertyName);
      end;

      for someGrouping:StatementGrouping in statementsByPropertyName do
      begin
        if(someGrouping.PropertyName = propertyName)then
        begin
          matchingGrouping:=someGrouping;
          break;
        end;
      end;

      if(not assigned(matchingGrouping))then
      begin
        matchingGrouping:= new StatementGrouping(PropertyName:=propertyName);
        statementsByPropertyName.Add(matchingGrouping);
      end;

      matchingGrouping.Statements.Add(someStatement);

    end;

    method AddStatementForRuleViolation(fullName:String; someStatement:RemObjects.Oxygene.Cirrus.Statements.Statement);
    begin
      var statements:List<Statement>;

      if(not StatementStorage.Statements.TryGetValue(fullName,out statements))then
      begin
        statements:= new List<Statement>;
        StatementStorage.Statements.Add(fullname, statements);
      end;

      statements.Add(someStatement);
    end;


  public
    constructor (message:String);
    begin
      self.Message := message;
    end;


    property Message:String;
  end;

end.