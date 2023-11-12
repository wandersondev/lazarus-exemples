{
 *Reescrito por Wanderson Santana Pinheiro em 11/11/2023
 *Conteúdo da vídeo aula do desevolvedor Humberto Sales
}

unit uFrmHintEx;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFrmHintEx }

  TFrmHintEx = class(TForm)
    btnShowHint: TButton;
    edtShowHint: TEdit;
    procedure btnShowHintClick(Sender: TObject);
    procedure edtShowHintEnter(Sender: TObject);
  private

  public

  end;

var
  FrmHintEx: TFrmHintEx;

implementation

{$R *.lfm}
procedure ActiveHint(Const AControl :TWinControl; Const AHint :String);
          //sub
          procedure DesactiveHint(Const AControl: TWinControl; NameHint :String);
          var
             vHint:TWinControl;
          begin
              vHint := AControl.FindComponent(NameHint) as THintWindow;
              if Assigned(vHint) then
                 FreeAndNil(vHint);
          end;
var
   VRect: TRect;
begin
  if(not Assigned(AControl)) then
     Exit;
  DesactiveHint(AControl,'Hint');
     with THintWindow.Create(AControl) do
       begin
         Name         := 'Hint';
         AutoHide     := True;
         Font.Name    := 'Verdana';
         Font.Size    := 8;
         Color        := Application.HintColor;
         VRect        := CalcHintRect(Screen.Width,AHint,Nil);
         VRect.Left   += AControl.ClientOrigin.X;
         VRect.Right  += AControl.ClientOrigin.X;
         VRect.Top    += AControl.ClientOrigin.Y - Height;
         VRect.Bottom += AControl.ClientOrigin.Y - Height;
         ActivateHint(VRect,AHint);
       end;

end;

{ TFrmHintEx }

procedure TFrmHintEx.btnShowHintClick(Sender: TObject);
begin
  ActiveHint(btnShowHint,'Show hint!');
end;

procedure TFrmHintEx.edtShowHintEnter(Sender: TObject);
begin
  ActiveHint(edtShowHint,'Show hint!');
end;

end.

