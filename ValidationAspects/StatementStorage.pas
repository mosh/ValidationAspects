namespace ValidationAspects;


uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  StatementStorage = public class
  private
    class _statements:Dictionary<string,List<Statement>>;
    class _statementsForIDataErrorInfo:Dictionary<string,List<StatementGrouping>>;

  protected
  public
    class constructor;
    begin
      _statements := new Dictionary<string,List<Statement>>;
      _statementsForIDataErrorInfo := new Dictionary<string,List<StatementGrouping>>;
    end;

    class property Statements:Dictionary<string,List<Statement>> read _statements;
    class property StatementsForIDataErrorInfo:Dictionary<string,List<StatementGrouping>> read _statementsForIDataErrorInfo;
  end;

  StatementGrouping = public class


  private
    _statements:List<Statement>;
  public
    constructor;
    begin
      self._statements := new List<Statement>;
    end;


    property PropertyName:String;
    property Statements:List<Statement> read _statements;
  end;



end.