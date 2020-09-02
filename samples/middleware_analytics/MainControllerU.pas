unit MainControllerU;

interface

uses
  MVCFramework, MVCFramework.Commons;

type

  [MVCPath('/api')]
  TMainController = class(TMVCController) 
  public
    [MVCPath('/')]
    [MVCHTTPMethod([httpGET])]
    procedure Index;

    [MVCPath('/reversedstrings/($Value)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetReversedString(const Value: String);
  protected
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;

  public
    //Sample CRUD Actions for a "Customer" entity
    [MVCPath('/customers')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCustomers;

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCustomer(id: Integer);

    [MVCPath('/customers')]
    [MVCHTTPMethod([httpPOST])]
    procedure CreateCustomer;

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpPUT])]
    procedure UpdateCustomer(id: Integer);

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpDELETE])]
    procedure DeleteCustomer(id: Integer);

  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils;

procedure TMainController.Index;
begin
  //use Context property to access to the HTTP request and response 
  Render('Hello DelphiMVCFramework World');
end;

procedure TMainController.GetReversedString(const Value: String);
begin
  Render(System.StrUtils.ReverseString(Value.Trim));
end;

procedure TMainController.OnAfterAction(Context: TWebContext; const AActionName: string); 
begin
  { Executed after each action }
  inherited;
end;

procedure TMainController.OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean);
begin
  { Executed before each action
    if handled is true (or an exception is raised) the actual
    action will not be called }
  inherited;
end;

//Sample CRUD Actions for a "Customer" entity
procedure TMainController.GetCustomers;
begin
  //todo: render a list of customers
end;

procedure TMainController.GetCustomer(id: Integer);
begin
  //todo: render the customer by id
end;

procedure TMainController.CreateCustomer;

begin
  //todo: create a new customer
end;

procedure TMainController.UpdateCustomer(id: Integer);
begin
  //todo: update customer by id
end;

procedure TMainController.DeleteCustomer(id: Integer);
begin
  //todo: delete customer by id
end;



end.
