program Cronometro;

uses
  Vcl.Forms,
  untMain in 'untMain.pas' {frmCronometro},
  untAbout in 'untAbout.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCronometro, frmCronometro);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
