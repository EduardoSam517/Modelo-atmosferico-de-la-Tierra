
%Garduño Gonzalez Eduardo Samuel
% Modelos Atmosfericos


function varargout = ATMISOT(varargin)

% Last Modified by GUIDE v2.5 04-Jun-2020 22:46:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ATMISOT_OpeningFcn, ...
                   'gui_OutputFcn',  @ATMISOT_OutputFcn, ...
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


% --- Executes just before ATMISOT is made visible.
function ATMISOT_OpeningFcn(hObject, eventdata, handles, varargin)
axes(handles.axes3);
[x,map]=imread('A.jpg');
image(x)
colormap(map);
axis off
hold on
% Choose default command line output for ATMISOT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = ATMISOT_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close (ATMISOT)
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
global P0 rho0 g z2 z1 h0 hz 
P0=101500;
rho0=1.2;
g=9.81;
h0=8600;
hz=3.5*h0;
P1=P0*exp(-z1/h0);
P2=P0*exp(-z2/h0);
set(handles.Presion1,'String',P1);
set(handles.Presion2,'String',P2);
z=linspace(z1,z2,100000);
C=z.*(1/h0);
P=P0.*exp(-C);
axes(handles.axes2)
plot(P,z,'color','g')
set(handles.axes2,'Color','k')
grid
title(handles.axes2,'Presión Atmósfera Isotérmica','color','w')
set(handles.axes2,'XColor','w')
set(handles.axes2,'YColor','w')
xlabel(handles.axes2,'Presion (Pa)','color','w')
ylabel(handles.axes2,'Altura (m)')
