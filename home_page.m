%Second page of the GUI to control the actuators
function varargout = home_page(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @home_page_OpeningFcn, ...
                   'gui_OutputFcn',  @home_page_OutputFcn, ...
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

function home_page_OpeningFcn(hObject, eventdata, handles, varargin)
movegui(gcf,'center')
handles.output = hObject;

guidata(hObject, handles);

function varargout = home_page_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%Button that open the page for actuator 1
function pushbutton1_Callback(hObject, eventdata, handles)
close(home_page);
page1;

%Button that open the page for actuator 2
function pushbutton2_Callback(hObject, eventdata, handles)
close(home_page);
page2;

%Button that activates both actuators to hold & kick with a delay between
%them
function pushbutton3_Callback(hObject, eventdata, handles)
prof1_for2_delay;

%Button that activates one at a time the 2 actuators to hold & kick
function pushbutton4_Callback(hObject, eventdata, handles)
prof1_for2;

%Button that activates both actuators for pulsated kicks with a delay between
%them
function pushbutton5_Callback(hObject, eventdata, handles)
pulsated_for2_delay;

%Button that activates one at a time the 2 actuators for pulsated kicks 
function pushbutton6_Callback(hObject, eventdata, handles)
pulsated_for2;

%Button that opens the page to set the criterias for a custom profil for
%both actuators working simultaneaously
function pushbutton9_Callback(hObject, eventdata, handles)
close(home_page);
custom_simultaneaous;

%Button that opens the page to set the criterias for a custom profil for
%both actuators working with a delay
function pushbutton10_Callback(hObject, eventdata, handles)
close(home_page);
custom_delay;
