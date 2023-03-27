

%Garduño Gonzalez Eduardo Samuel
% Modelos Atmosfericos


function varargout = ATMISOE(varargin)

% Last Modified by GUIDE v2.5 02-Jun-2020 21:40:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ATMISOE_OpeningFcn, ...
                   'gui_OutputFcn',  @ATMISOE_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ATMISOE is made visible.
function ATMISOE_OpeningFcn(hObject, eventdata, handles, varargin)
axes(handles.axes4);
[x,map]=imread('A.jpg');
image(x)
colormap(map);
axis off
hold on
% Choose default command line output for ATMISOE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = ATMISOE_OutputFcn(hObject, eventdata, handles)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close(ATMISOE)
ModelosATM



function altura1_Callback(hObject, eventdata, handles)
global z1
z1=str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function altura1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function altura2_Callback(hObject, eventdata, handles)
global z2
z2=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function altura2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global P0 rho0 g h0 hz T0 z1 z2
P0=(101500);
rho0=(1.2);
g=(9.81);
h0=(8600);
hz=(3.5*h0);
T0=(15);
P1=(P0*(1-(z1/hz))^3.5);
P2=(P0*(1-(z2/hz))^3.5);
rho1=(rho0*(1-(z1/hz))^2.5);
rho2=(rho0*(1-(z2/hz))^2.5);
T1=(T0*(1-(z1/hz)));
T2=(T0*(1-(z2/hz)));
set(handles.Presion1,'String',P1);
set(handles.Presion2,'String',P2);
set(handles.dens1,'String',rho1);
set(handles.dens2,'String',rho2);
set(handles.Temp1,'String',T1);
set(handles.Temp2,'String',T2);
z=linspace(z1,z2,100000);
P=(P0.*(1-(z./hz)).^3.5);
rho=(rho0*(1-(z./hz)).^2.5);
T=(T0.*(1-(z./hz)));

axes(handles.Pre);
plot(P,z,'color','r')
set(handles.Pre,'Color','k')
grid
title(handles.Pre,'Presión Atmósfera Isoentrópica','color','w')
set(handles.Pre,'XColor','w')
set(handles.Pre,'YColor','w')
xlabel(handles.Pre,'Presión (Pa)')
ylabel(handles.Pre,'Altura (m)')

axes(handles.Temp);
plot(T,z,'color','b')
set(handles.Temp,'Color','k')
grid
title(handles.Temp,'Temperatura Atmósfera Isoentrópica','color','w')
set(handles.Temp,'XColor','w')
set(handles.Temp,'YColor','w')
xlabel(handles.Temp,'Temperatura (K)')
ylabel(handles.Temp,'Altura (m)')

axes(handles.Dens);
plot(rho,z,'color','g')
set(handles.Dens,'Color','k')
grid
title(handles.Dens,'Densidad Atmósfera Isoentrópica','color','w')
set(handles.Dens,'XColor','w')
set(handles.Dens,'YColor','w')
xlabel(handles.Dens,'Densidad (kg/m^3)')
ylabel(handles.Dens,'Altura (m)')
