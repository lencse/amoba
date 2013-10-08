unit Amobaf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, TablaU, Buttons, ActnList, ScktComp, ComCtrls;

type
  string20=string[20];
  TGeptul=record
    proc:boolean;
    exefile:string;
  end;
  TColopt=record
    hlc,xc,oc,tc,rc:tcolor;
  end;
  TOptions=record
    ir:array[1..2] of byte;
    iksz,kezd,tm:byte;
    ido:integer;
    n:array[1..2] of string20;
    gt:array[1..2] of TGeptul;
    gomb:boolean;
    col:TColopt;
  end;
  TFormFo = class(TForm)
    MainMenu1: TMainMenu;
    Timer1: TTimer;
    Menu1: TMenuItem;
    Menu11: TMenuItem;
    Menu12: TMenuItem;
    N1: TMenuItem;
    Menu14: TMenuItem;
    Menu13: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    ActionList1: TActionList;
    acNewGame: TAction;
    acOptions: TAction;
    acQuit: TAction;
    acStep: TAction;
    ClientSocket1: TClientSocket;
    ServerSocket1: TServerSocket;
    acConnect: TAction;
    Menu15: TMenuItem;
    acDisconnect: TAction;
    Menu16: TMenuItem;
    Menu2: TMenuItem;
    Menu21: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure procQuit(Sender: TObject);
    procedure procOptions(Sender: TObject);
    procedure procNewGame(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure procStep(Sender: TObject);
    procedure acConnectExecute(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1Accept(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure acDisconnectExecute(Sender: TObject);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormDestroy(Sender: TObject);
    procedure Menu21Click(Sender: TObject);
  private
    invalid,bill,server:boolean;
    opt: Toptions;
    fgy:array[1..3] of integer;
    fmostjon,bx,by:byte;
    def: TTabla;
    procedure lepes;
    procedure elkezd;
    procedure ujmenet;
    procedure procinvalid;
    function getmostjon: byte;
    procedure setmostjon(const Value: byte);
    function Gett(i, j: byte): byte;
    procedure Sett(i, j: byte; const Value: byte);
    function getgy(i: byte): integer;
    procedure setgy(i: byte; const Value: integer);
    function getir(i: byte): byte;
    procedure setir(i: byte; const Value: byte);
    procedure Setiksz(const Value: byte);
    function Getiksz: byte;
    function getkezd: byte;
    procedure setkezd(const Value: byte);
    function gettm: byte;
    procedure settm(const Value: byte);
    function getido: integer;
    procedure setido(const Value: integer);
    function getn(i: byte): ShortString;
    procedure setn(i: byte; const Value: ShortString);
    function getgt(i: byte): tgeptul;
    procedure setgt(i: byte; const Value: tgeptul);
    function getgomb: boolean;
    procedure setgomb(const Value: boolean);
    function getcol: tcolopt;
    procedure setcol(const Value: tcolopt);
    procedure fkeydown(var msg:tmsg;var handled:boolean);
  public
    property gy[i:byte]:integer read getgy write setgy;
    property mostjon:byte read getmostjon write setmostjon;
    property t[i,j:byte]:byte read gett write sett;
    // Options
    property ir[i:byte]:byte read getir write setir;
    property iksz:byte read getiksz write setiksz;
    property kezd:byte read getkezd write setkezd;
    property tm:byte read gettm write settm;
    property ido:integer read getido write setido;
    property n[i:byte]:shortstring read getn write setn;
    property gt[i:byte]:tgeptul read getgt write setgt;
    property gomb:boolean read getgomb write setgomb;
    property col:tcolopt read getcol write setcol;
  end;

var
  FormFo: TFormFo;

implementation

uses Optionsf, LunarStrain, Math, Tovabblepf, Netf, Askf, Nevjegyf;

{$R *.DFM}

type
  topt0=record
    ir:array[1..2] of byte;
    iksz,kezd,tm:byte;
    ido:integer;
    n:array[1..2] of string20;
    gomb:boolean;
    col:TColopt;
  end;

procedure TFormFo.lepes;
var hx,hy,i,j:byte;
    f:textfile;
begin
  if ir[mostjon]<>2 then exit;
  if gt[mostjon].proc then
    def.gep(mostjon,hx,hy)
  else
    begin
      assignfile(f,'amoba0.tmp');
      rewrite(f);
      writeln(f,def.m,' ',mostjon);
      for i:=1 to def.m do
        begin
          for j:=1 to def.m do
            write(f,t[j,i]);
          writeln(f);
        end;
      closefile(f);
      winexec(pchar(gt[mostjon].exefile),sw_hide);
      assignfile(f,'amoba1.tmp');
      reset(f);
      readln(f,hx,hy);
      closefile(f);
      erase(f);
    end;
  t[hx,hy]:=mostjon;
end;

procedure TFormFo.elkezd;
var a:integer;
begin
  gy[1]:=0;
  gy[2]:=0;
  gy[3]:=0;
  if tm<10 then
    a:=185
  else
    a:=tm*18+5;
  clientheight:=a;
  panel1.height:=a-5;
  ujmenet;
end;

procedure TFormFo.ujmenet;
begin
  bill:=false;
  def.m:=tm;
  mostjon:=kezd;
  refresh;
  panel1.width:=max(max(label1.width+label4.width,label3.width+label5.width)+24,114);
  label4.left:=panel1.width-8-label4.width;
  label5.left:=panel1.width-8-label5.width;
  label6.left:=panel1.width-8-label6.width;
  clientwidth:=tm*18+panel1.width+15;
  panel1.left:=clientwidth-panel1.width-5;
  lepes;
  timer1.Enabled:=(ir[1]+ir[2]=4) and not gomb;
end;

procedure TFormFo.FormCreate(Sender: TObject);
var opt0:topt0;
    c0:tcolopt;
    gt0:tgeptul;
    f:file of topt0;
begin
  left:=0;
  top:=0;
  application.OnMessage:=fkeydown;
  if fileexists('amoba0.cfg') then
    begin
      assignfile(f,'amoba0.cfg');
      reset(f);
      read(f,opt0);
      closefile(f);
      ir[1]:=opt0.ir[1];
      ir[2]:=opt0.ir[2];
      n[1]:=opt0.n[1];
      n[2]:=opt0.n[2];
      iksz:=opt0.iksz;
      kezd:=opt0.kezd;
      tm:=opt0.tm;
      col:=opt0.col;
      gomb:=opt0.gomb;
      ido:=opt0.ido;
    end
  else
    begin
      ir[1]:=1;
      ir[2]:=2;
      n[1]:='Lencse';
      n[2]:='Computer';
      iksz:=1;
      kezd:=1;
      tm:=28;
      with c0 do
        begin
          hlc:=claqua;
          xc:=clred;
          oc:=clblue;
          tc:=8454143;
          rc:=clblack;
        end;
      col:=c0;
      gomb:=true;
      ido:=100;
    end;
  with gt0 do
    begin
      proc:=true;
      exefile:=getcurrentdir+'\Transparent.exe';
    end;
  gt[1]:=gt0;
  gt[2]:=gt0;
  bx:=1;
  by:=1;
  def:=ttabla.create(tm);
  procinvalid;
end;

procedure TFormFo.procQuit(Sender: TObject);
begin
  close;
end;

procedure TFormFo.procOptions(Sender: TObject);
begin
  timer1.enabled:=false;
  try
    if not assigned(optionsform) then
      optionsform:=toptionsform.Create(application);
    opt0:=opt;
    optionsform.showmodal;
    ir[1]:=opt0.ir[1];
    ir[2]:=opt0.ir[2];
    iksz:=opt0.iksz;
    kezd:=opt0.kezd;
    tm:=opt0.tm;
    ido:=opt0.ido;
    n[1]:=opt0.n[1];
    n[2]:=opt0.n[2];
    gt[1]:=opt0.gt[1];
    gt[2]:=opt0.gt[2];
    gomb:=opt0.gomb;
    col:=opt0.col;
    procinvalid;
  finally
    freeandnil(optionsform);
  end;
  timer1.Enabled:=(ir[1]+ir[2]=4) and not gomb;
end;

procedure TFormFo.procNewGame(Sender: TObject);
begin
  timer1.enabled:=false;
  if dialogwin('Biztos újat akar kezdeni?','Új játék',[mbyes,mbno])=mryes then elkezd;
  timer1.Enabled:=(ir[1]+ir[2]=4) and not gomb;
end;

procedure TFormFo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  timer1.enabled:=false;
  canclose:=dialogwin('Biztos ki akar lépni?','Kilépés',[mbyes,mbno])=mryes;
  timer1.Enabled:=(ir[1]+ir[2]=4) and not gomb;
end;

procedure TFormFo.FormPaint(Sender: TObject);
var i,j,a,b:byte;
    c,d:shortint;
    x1,y1,x2,y2:integer;
begin
  with canvas,col do
    begin
      Pen.Color:=rc;
      Brush.Color:=tc;
      Rectangle(5,0,5+tm*18+1,tm*18+1);
      for i:=1 to tm-1 do
        begin
          MoveTo(5+i*18,0);
          LineTo(5+i*18,tm*18);
          MoveTo(5,i*18);
          LineTo(5+tm*18,i*18);
        end;
      if bill then
        begin
          pen.color:=col.rc;
          emptyrect(canvas,bx*18-12,by*18-17,bx*18+4,by*18-1);
        end;
      if def.gyoztes(a,b,c,d)>0 then
        begin
          pen.color:=hlc;
          brush.color:=hlc;
          for i:=0 to 4 do
            rectangle((a+i*c)*18-12,(b+i*d)*18-17,(a+i*c)*18+5,(b+i*d)*18);
        end;
      for i:=1 to tm do
        for j:=1 to tm do
          if t[i,j]<>0 then
            begin
              x1:=i*18-9;
              y1:=j*18-14;
              x2:=i*18+2;
              y2:=j*18-3;
              if t[i,j]=iksz then
                begin
                  Pen.color:=xc;
                  MoveTo(x1,y1);
                  LineTo(x2,y2);
                  MoveTo(x1+1,y1);
                  LineTo(x2,y2-1);
                  MoveTo(x1,y1+1);
                  LineTo(x2-1,y2);
                  MoveTo(x1,y2-1);
                  LineTo(x2,y1-1);
                  MoveTo(x1,y2-2);
                  LineTo(x2-1,y1-1);
                  MoveTo(x1+1,y2-1);
                  LineTo(x2,y1);
                end
              else
                begin
                  Pen.color:=oc;
                  brush.color:=oc;
                  Ellipse(x1,y1,x2,y2);
                end;
            end;
    end;
end;

procedure TFormFo.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var hx,hy:byte;
begin
  if button<>mbleft then exit;
  if ir[mostjon]<>1 then exit;
  if (x<=5) or (x>=5+tm*18) or (y<=0) or (y>=tm*18) then exit;
  if ((x-5) mod 18=0) or (y mod 18=0) then exit;
  hx:=(x-6) div 18+1;
  hy:=(y-1) div 18+1;
  if t[hx,hy]>0 then exit;
  t[hx,hy]:=mostjon;
  lepes;
end;

procedure TFormFo.procStep(Sender: TObject);
begin
  lepes;
end;

function TFormFo.getmostjon: byte;
begin
  result:=fmostjon;
end;

procedure TFormFo.setmostjon(const Value: byte);
begin
  fmostjon:=value;
  if value=1 then
    begin
      label1.Font.Style:=label1.Font.Style+[fsbold];
      label3.Font.Style:=label3.Font.Style-[fsbold];
    end
  else
    begin
      label1.Font.Style:=label1.Font.Style-[fsbold];
      label3.Font.Style:=label3.Font.Style+[fsbold];
    end;
end;

function TFormFo.gett(i, j: byte): byte;
begin
  result:=def.t[i,j];
end;

procedure TFormFo.sett(i, j: byte; const Value: byte);
var rec:trect;
    er,msg:string;
    k,gy0,x1,y1:byte;
    x2,y2:shortint;
begin
  bill:=false;
  def.t[i,j]:=value;
  if ir[3-mostjon]=3 then
    begin
      msg:=chr(i)+chr(j);
      if server then
        serversocket1.Socket.Connections[0].SendText(msg)
      else
        clientsocket1.Socket.SendText(msg);
    end;
  rec:=rect(i*18-9,j*18-14,i*18+2,j*18-3);
  invalidaterect(handle,@rec,false);
  gy0:=def.gyoztes(x1,y1,x2,y2);
  if gy0<>0 then
    begin
      timer1.enabled:=false;
      for k:=0 to 4 do
        begin
          rec:=rect((x1+k*x2)*18-12,(y1+k*y2)*18-17,(x1+k*x2)*18+5,(y1+k*y2)*18);
          invalidaterect(handle,@rec,true);
        end;
      if gy0=3 then
        er:='Döntetlen!'
      else
        er:='A gyõztes: '+n[gy0];
      if dialogwin(er+#13+#13+'Folytatja?','Vége',[mbyes,mbno])=mryes then
        begin
          gy[gy0]:=gy[gy0]+1;
          ujmenet;
        end
      else
        application.terminate;
    end
  else
    mostjon:=3-mostjon;
end;

function TFormFo.getgy(i: byte): integer;
begin
  result:=fgy[i];
end;

procedure TFormFo.setgy(i: byte; const Value: integer);
begin
  fgy[i]:=value;
  label4.Caption:=inttostr(fgy[1]);
  label6.Caption:=inttostr(fgy[2]);
  label5.Caption:=inttostr(fgy[3]);
end;

function TFormFo.getir(i: byte): byte;
begin
  result:=opt.ir[i];
end;

procedure TFormFo.setir(i: byte; const Value: byte);
begin
  if value<>opt.ir[i] then
    begin
      opt.ir[i]:=value;
      invalid:=true;
    end;
end;

procedure TFormFo.setiksz(const Value: byte);
begin
  opt.iksz:=Value;
  refresh;
end;

function TFormFo.getiksz: byte;
begin
  result:=opt.iksz;
end;

function TFormFo.getkezd: byte;
begin
  result:=opt.kezd;
end;

procedure TFormFo.setkezd(const Value: byte);
begin
  opt.kezd:=value;
end;

function TFormFo.gettm: byte;
begin
  result:=opt.tm;
end;

procedure TFormFo.settm(const Value: byte);
begin
  if opt.tm<>value then
    begin
      opt.tm:=value;
      invalid:=true;
    end;
end;

function TFormFo.getido: integer;
begin
  result:=opt.ido;
end;

procedure TFormFo.setido(const Value: integer);
begin
  opt.ido:=value;
  timer1.Interval:=value;
end;

function TFormFo.getn(i: byte): shortstring;
begin
  result:=opt.n[i];
end;

procedure TFormFo.setn(i: byte; const Value: shortstring);
begin
  if opt.n[i]<>value then
    begin
      opt.n[i]:=value;
      invalid:=true;
      if i=1 then
        label1.caption:=value
      else
        label3.caption:=value;
    end;
end;

function TFormFo.getgt(i: byte): tgeptul;
begin
  result:=opt.gt[i];
end;

procedure TFormFo.setgt(i: byte; const Value: tgeptul);
begin
  if (opt.gt[i].proc<>value.proc) or (opt.gt[i].exefile<>value.exefile) then
    begin
      opt.gt[i]:=value;
      invalid:=true;
    end;
end;

function TFormFo.getgomb: boolean;
begin
  result:=opt.gomb;
end;

procedure TFormFo.setgomb(const Value: boolean);
begin
  opt.gomb:=value;
  if (ir[1]+ir[2]=4) and value then
    begin
      if not assigned(formtovabblep) then
        formtovabblep:=tformtovabblep.Create(application);
      formtovabblep.left:=self.left+tm*18+25;
      formtovabblep.top:=self.top+180;
      formtovabblep.Show;
      acstep.visible:=true;
    end
  else
    begin
      if assigned(formtovabblep) then
        freeandnil(formtovabblep);
      acstep.visible:=false;
    end;
  timer1.Enabled:=(opt.ir[1]+opt.ir[2]=4) and not value;
end;

function TFormFo.getcol: tcolopt;
begin
  result:=opt.col;
end;

procedure TFormFo.setcol(const Value: tcolopt);
begin
  opt.col:=value;
  refresh;
end;

procedure TFormFo.procinvalid;
begin
  if invalid then
    begin
      invalid:=false;
      elkezd;
    end;
end;

procedure TFormFo.fkeydown(var msg: tmsg; var handled: boolean);
begin
  if msg.message=wm_keydown then
    if formfo.active then
      if msg.wparam in [vk_left,vk_right,vk_up,vk_down,32,75] then
        begin
          handled:=true;
          if bill then
            begin
              canvas.pen.color:=col.tc;
              emptyrect(canvas,bx*18-12,by*18-17,bx*18+4,by*18-1);
            end;
          bill:=true;
          case msg.wParam of
            vk_left:if bx=1 then bx:=tm else dec(bx);
            vk_right:if bx=tm then bx:=1 else inc(bx);
            vk_up:if by=1 then by:=tm else dec(by);
            vk_down:if by=tm then by:=1 else inc(by);
            32:
              if ir[mostjon]=1 then
                if t[bx,by]=0 then
                  begin
                    t[bx,by]:=mostjon;
                    lepes;
                  end;
            75:
              if assigned(formtovabblep) then
                begin
                  bill:=false;
                  formtovabblep.SetFocus;
                end;
          end;
          if bill then
            begin
              canvas.pen.color:=col.rc;
              emptyrect(canvas,bx*18-12,by*18-17,bx*18+4,by*18-1);
            end;
        end;
end;

procedure TFormFo.acConnectExecute(Sender: TObject);
var j0,k0:byte;
begin
  try
    formnet:=tformnet.Create(application);
    if formnet.showmodal=mrok then
      begin
        j0:=formnet.Combobox1.ItemIndex+1;
        if formnet.CheckBox1.Checked then
          k0:=j0
        else
          k0:=3-j0;
        if clientsocket1.Active then clientsocket1.Active:=false;
        clientsocket1.host:=formnet.Edit1.Text;
        clientsocket1.active:=true;
        clientsocket1.Socket.Sendtext('////'+chr(j0)+chr(k0)+n[3-j0]);
        acdisconnect.Visible:=true;
        acconnect.Visible:=false;
      end;
  finally
    freeandnil(formnet);
  end;
end;

procedure TFormFo.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  caption:='Amõba v3.0 - '+socket.RemoteHost;
  acdisconnect.Visible:=true;
  acconnect.Visible:=false;
end;

procedure TFormFo.ServerSocket1Accept(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  server:=true;
  caption:='Amõba v3.0 - '+socket.RemoteHost;
  acdisconnect.Visible:=true;
  acconnect.Visible:=false;
end;

procedure TFormFo.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var msg,s:string;
    j0,k0:byte;
begin
  msg:=socket.ReceiveText;
  if copy(msg,1,4)='//// ' then
    begin
      delete(msg,1,4);
      j0:=ord(msg[1]);
      k0:=ord(msg[2]);
      delete(msg,1,2);
      s:=inttostr(3-j0)+'. játékos'+'Név: '+msg+#13;
      if j0<>k0 then
        s:=s+'Nem ';
      s:=s+'kezdõjátékos';
      try
        formask:=tformask.Create(application);
        formask.Label1.Caption:=s;
        formask.edit1.Text:=n[j0];
        formask.RadioButton1.Checked:=ir[j0]=1;
        formask.RadioButton2.Checked:=ir[j0]=2;
        if formask.showmodal=mrok then
          begin
            ir[3-j0]:=3;
            n[3-j0]:=msg;
            kezd:=k0;
            if formask.radiobutton1.checked then
              ir[j0]:=1
            else
              ir[j0]:=2;
            serversocket1.Socket.Connections[0].SendText('////'+chr(j0)+chr(k0)+n[j0]);
            procinvalid;
          end
        else
          begin
            serversocket1.Socket.Connections[0].SendText('----');
            caption:='Amõba v3.0';
            acdisconnect.Visible:=false;
            acconnect.Visible:=true;
          end;
      finally
        freeandnil(formask);
      end;
    end
  else
    begin
      if ir[mostjon]<>3 then exit;
      t[ord(msg[1]),ord(msg[2])]:=mostjon;
    end;
end;

procedure TFormFo.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var msg:string;
begin
  msg:=socket.ReceiveText;
  if msg='----' then
    begin
      dialogwin('Nem fogadta el a kérelmet','Meghiúsult',[mbok]);
      caption:='Amõba v3.0';
      clientsocket1.Active:=false;
      acdisconnect.Visible:=false;
      acconnect.Visible:=true;
    end
  else
    if copy(msg,1,4)='////' then
      begin
        delete(msg,1,4);
        ir[ord(msg[1])]:=3;
        n[ord(msg[1])]:=copy(msg,3,length(msg)-2);
        kezd:=ord(msg[2]);
        procinvalid;
      end
    else
      begin
        if ir[mostjon]<>3 then exit;
        t[ord(msg[1]),ord(msg[2])]:=mostjon;
      end;
end;

procedure TFormFo.acDisconnectExecute(Sender: TObject);
begin
  clientsocket1.Active:=false;
  serversocket1.active:=true;
  acdisconnect.Visible:=false;
  acconnect.Visible:=true;
  caption:='Amõba v3.0';
end;

procedure TFormFo.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  dialogwin('Nem tudok csatlakozni!','Hiba',[mbok]);
  acdisconnect.Visible:=false;
  acconnect.Visible:=true;
end;

procedure TFormFo.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  caption:='Amõba v3.0';
  acdisconnect.Visible:=false;
  acconnect.Visible:=true;
end;

procedure TFormFo.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  acdisconnectexecute(self);
end;

procedure TFormFo.FormDestroy(Sender: TObject);
var f:file of topt0;
    opt0:topt0;
begin
  if opt.ir[1]=3 then opt.ir[1]:=2;
  if opt.ir[2]=3 then opt.ir[2]:=2;
  opt0.ir[1]:=opt.ir[1];
  opt0.ir[2]:=opt.ir[2];
  opt0.iksz:=opt.iksz;
  opt0.kezd:=opt.kezd;
  opt0.tm:=opt.tm;
  opt0.ido:=opt.ido;
  opt0.n[1]:=opt.n[1];
  opt0.n[2]:=opt.n[2];
  opt0.gomb:=opt.gomb;
  opt0.col:=opt.col;
  assignfile(f,'amoba0.cfg');
  rewrite(f);
  write(f,opt0);
  closefile(f);
end;

procedure TFormFo.Menu21Click(Sender: TObject);
begin
  try
    formnevjegy:=tformnevjegy.Create(application);
    formnevjegy.Showmodal;
  finally
    freeandnil(formnevjegy);
  end;
end;

end.
