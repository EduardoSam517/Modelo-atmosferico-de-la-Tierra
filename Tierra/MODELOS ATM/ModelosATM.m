

%Garduño Gonzalez Eduardo Samuel
% Modelos Atmosfericos


function varargout = ModelosATM(varargin)

% Last Modified by GUIDE v2.5 04-Jun-2020 23:36:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ModelosATM_OpeningFcn, ...
                   'gui_OutputFcn',  @ModelosATM_OutputFcn, ...
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


% --- Executes just before ModelosATM is made visible.
function ModelosATM_OpeningFcn(hObject, eventdata, handles, varargin)
axes(handles.axes1);
[x,map]=imread('A.jpg');
image(x)
colormap(map);
axis off
hold on
% Choose default command line output for ModelosATM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = ModelosATM_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, ~, handles)
close(ModelosATM)
ATMIM

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
close(ModelosATM)
ATMISOT


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
close(ModelosATM)
ATMISOE


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
close(ModelosATM)
Comparacion
