unit Unit1;

interface

uses
  MVCFramework,
  MVCFramework.Commons,
  MVCFramework.Serializer.Commons,
  MVCFramework.Nullables;

type
  TBoleto = class
  private
    FnossoNumero: string;
    Ftipodesconto: NullableString;
  public
    property nossoNumero: string read FnossoNumero write FnossoNumero;
    property tipodesconto: NullableString read Ftipodesconto write Ftipodesconto;
  end;

  [MVCPath('/api')]
  TMyController = class(TMVCController)
  public
    [MVCPath]
    [MVCHTTPMethod([httpGET])]
    procedure Index;

    [MVCPath('/reversedstrings/($Value)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetReversedString(const Value: string);
  end;

implementation

uses
  System.SysUtils,
  MVCFramework.Logger,
  System.StrUtils;

procedure TMyController.Index;
begin
  var Boleto := TBoleto.Create;
  Boleto.nossoNumero := '123456789';
  Boleto.tipodesconto := 'VALOR';
  Render(Boleto);
end;

procedure TMyController.GetReversedString(const Value: string);
begin
  Render(System.StrUtils.ReverseString(Value.Trim));
end;

end.

