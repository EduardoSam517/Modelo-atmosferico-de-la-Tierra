

%Garduño Gonzalez Eduardo Samuel
% Modelos Atmosfericos


function varargout = ATMIM(varargin)

% Last Modified by GUIDE v2.5 04-Jun-2020 18:48:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ATMIM_OpeningFcn, ...
                   'gui_OutputFcn',  @ATMIM_OutputFcn, ...
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


% --- Executes just before ATMIM is made visible.
function ATMIM_OpeningFcn(hObject, ~, handles, varargin)
axes(handles.axes7);
[x,map]=imread('A.jpg');
image(x)
colormap(map);
axis off
hold on
% Choose default command line output for ATMIM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = ATMIM_OutputFcn(~, eventdata, handles)

% Get default command line output from handles structure
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


% --- Executes on button press in PresionA.
function PresionA_Callback(hObject, eventdata, handles)
global P0 rho0 g z1 z2
P0=(1.015*(10^5));
rho0=(1.2);
g=(9.81);
P1=(P0-g*rho0*z1);
P2=(P0-g*rho0*z2);
set(handles.Presion1,'String',P1);
set(handles.Presion2,'String',P2);
Z=linspace(z1,z2,100000);
P=(P0-(rho0.*g.*Z));
axes(handles.GATMOS)
plot(P,Z)
set(handles.GATMOS,'Color','k')
grid
title(handles.GATMOS,'Presión Atmósfera Incompresible','color','w')
set(handles.GATMOS,'XColor','w')
set(handles.GATMOS,'YColor','w')
xlabel(handles.GATMOS,'Presión (Pa)'),
ylabel(handles.GATMOS,'Altura (m)');


% --- Executes on button press in Menu.
function Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(ATMIM)
ModelosATM



function Prof1_Callback(hObject, eventdata, handles)
% hObject    handle to Prof1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zm1
zm1=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of Prof1 as text
%        str2double(get(hObject,'String')) returns contents of Prof1 as a double


% --- Executes during object creation, after setting all properties.
function Prof1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Prof1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Prof2_Callback(hObject, eventdata, handles)
global zm2
zm2=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function Prof2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Prof2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PresionM.
function PresionM_Callback(hObject, eventdata, handles)
global P0 rhoM g zm1 zm2 Zm
P0=(1.015*(10^5));
rhoM=(1000);
g=(9.81);
Pm1=(P0+g*rhoM*zm1);
Pm2=(P0+g*rhoM*zm2);
set(handles.PresM1,'String',Pm1);
set(handles.PresM2,'String',Pm2);
Zm=linspace(zm1,zm2,100000);
Pm=(P0+rhoM.*g.*Zm);
axes(handles.GMAR);
plot(Pm,Zm,'color','r')
set(handles.GMAR,'Color','k')
grid
title(handles.GMAR,'Presión Mar Incompresible','color','w')
set(handles.GMAR,'XColor','w')
set(handles.GMAR,'YColor','w')
xlabel(handles.GMAR,'Presion (Pa)','color','w')
ylabel(handles.GMAR,'Profundidad (m)')
