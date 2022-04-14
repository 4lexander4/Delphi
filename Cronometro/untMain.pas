unit untMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmCronometro = class(TForm)
    lblHoras: TLabel;
    lblMin: TLabel;
    lblSeg: TLabel;
    btnIniciar: TButton;
    tmrCronometro: TTimer;
    btnVolta: TButton;
    lblDoisP1: TLabel;
    lblDoisP2: TLabel;
    memoVoltas: TMemo;
    btnReiniciar: TButton;
    Button1: TButton;
    procedure btnIniciarClick(Sender: TObject);
    procedure tmrCronometroTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CalcularTempo;
    procedure btnVoltaClick(Sender: TObject);
    procedure btnReiniciarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmCronometro: TfrmCronometro;

implementation

{$R *.dfm}

uses untAbout;

var
  lSegundos, lMinutos, lHoras, lVolta : Float32;

procedure TfrmCronometro.FormShow(Sender: TObject);
begin
  lSegundos := 0;
  lMinutos := 0;
  lHoras := 0;
  lVolta := 0;
end;

procedure TfrmCronometro.btnIniciarClick(Sender: TObject);
begin
  if tmrCronometro.Enabled = false then
  begin
    tmrCronometro.Enabled := not tmrCronometro.Enabled;
    btnIniciar.Caption := 'Pausar';

    btnVolta.Visible := true;
    memoVoltas.Visible := true;
    btnReiniciar.Visible := true;
  end
  else
  begin
    tmrCronometro.Enabled := not tmrCronometro.Enabled;

    btnIniciar.Caption := 'Retomar';
  end;
end;

procedure TfrmCronometro.tmrCronometroTimer(Sender: TObject);
begin
  lSegundos := lSegundos + 1;
  CalcularTempo;
end;

procedure TfrmCronometro.btnVoltaClick(Sender: TObject);
begin
  lVolta := lVolta + 1;

  memoVoltas.Lines.Add('Volta ' + FloatToStr(lVolta) + ' - ' +
                        FormatFloat('00',lHoras) + ':' +
                        FormatFloat('00',lMinutos) + ':' +
                        FormatFloat('00',lSegundos));
end;

procedure TfrmCronometro.Button1Click(Sender: TObject);
var
  lAbout : TfrmAbout;
begin
  lAbout := TfrmAbout.Create(nil);
  lAbout.ShowModal;
end;

procedure TfrmCronometro.btnReiniciarClick(Sender: TObject);
begin
    lVolta := 0;
    lSegundos := 0;
    lMinutos := 0;
    lHoras := 0;

    lblSeg.Caption := FormatFloat('00', lSegundos);
    lblMin.Caption := FormatFloat('00', lMinutos);
    lblHoras.Caption := FormatFloat('00', lHoras);

    btnIniciar.Caption := 'Iniciar';

    memoVoltas.Clear;
    memoVoltas.Visible := false;
    btnVolta.Visible := false;
    btnReiniciar.Visible := false;

    tmrCronometro.Enabled := false;
end;

procedure TfrmCronometro.CalcularTempo;
begin
  if lSegundos < 60 then
  begin
    lblSeg.Caption := FormatFloat('00', lSegundos);
  end
  else
  begin
    lSegundos := 0;
    lblSeg.Caption := FormatFloat('00', lSegundos);

    if lMinutos < 60 then
    begin
      lMinutos := lMinutos + 1;
      lblMin.Caption := FormatFloat('00', lMinutos);
    end
    else
    begin
      lMinutos := 0;
      lblMin.Caption := FormatFloat('00', lMinutos);

      lHoras := lHoras + 1;
      lblHoras.Caption := FormatFloat('00', lHoras);
    end;
  end;
end;

end.
