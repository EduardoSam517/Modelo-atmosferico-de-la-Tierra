

%Garduño Gonzalez Eduardo Samuel
% Modelos Atmosfericos


function varargout = Comparacion(varargin)

% Last Modified by GUIDE v2.5 05-Jun-2020 01:22:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Comparacion_OpeningFcn, ...
                   'gui_OutputFcn',  @Comparacion_OutputFcn, ...
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


% --- Executes just before Comparacion is made visible.
function Comparacion_OpeningFcn(hObject, eventdata, handles, varargin)
axes(handles.axes4);
[x,map]=imread('A.jpg');
image(x)
colormap(map);
axis off
hold on
% Choose default command line output for Comparacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Comparacion_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



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


% --- Executes on button press in Comparar.
function Comparar_Callback(hObject, eventdata, handles)
global z1 z2 z
P0=(1.015*(10^5));
rho0=(1.2);
g=(9.81);
h0=(8600);
hz=(3.5*h0);
T0=(15);
P1=(P0-g*rho0*z1);
P2=(P0-g*rho0*z2);
P=(P0-(rho0.*g.*z));
axes(handles.Incom)
plot(P,z,'color','g')
set(handles.Incom,'Color','k')
grid
title(handles.Incom,'Presión Atmósfera Incompresible','color','w')
set(handles.Incom,'XColor','w')
set(handles.Incom,'YColor','w')
xlabel(handles.Incom,'Presión (Pa)'),
ylabel(handles.Incom,'Altura (m)');

axes(handles.Isot)
PT1=P0*exp(-z1/h0);
PT2=P0*exp(-z2/h0);
z=linspace(z1,z2,100000);
C=z.*(1/h0);
PT=P0.*exp(-C);
plot(handles.Isot,PT,z)
set(handles.Isot,'Color','k')
grid
title(handles.Isot,'Presión Atmósfera Isotérmica','color','w')
set(handles.Isot,'XColor','w')
set(handles.Isot,'YColor','w')
xlabel(handles.Isot,'Presion (Pa)')
ylabel(handles.Isot,'Altura (m)')

axes(handles.Isoe);
P=abs((P0.*(1-(z./hz)).^3.5));
plot(P,z,'color','r')
set(handles.Isoe,'Color','k')
grid
title(handles.Isoe,'Presión Atmósfera Isoentrópica','color','w')
set(handles.Isoe,'XColor','w')
set(handles.Isoe,'YColor','w')
xlabel(handles.Isoe,'Presión (Pa)')
ylabel(handles.Isoe,'Altura (m)')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
close(Comparacion)
ModelosATM
