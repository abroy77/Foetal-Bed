%Page to activate profiles for the 1st actuator
function varargout = page1(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @page1_OpeningFcn, ...
                   'gui_OutputFcn',  @page1_OutputFcn, ...
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

function page1_OpeningFcn(hObject, eventdata, handles, varargin)
movegui(gcf,'center')
handles.output = hObject;

guidata(hObject, handles);

function varargout = page1_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%Activates the kick & hold profil 
function pushbutton4_Callback(hObject, eventdata, handles)
prof1;

%Activates the pulsated kicks profil
function pushbutton5_Callback(hObject, eventdata, handles)
pulsated;

%Takes in the information set by the user for the number of kicks
function edit1_Callback(hObject, eventdata, handles)
numkicks = str2double(get(hObject,'String'));
handles.numkicks = numkicks;
guidata(hObject, handles);

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Takes in the information set by the user for the percentage of extension
%of the actuator
function edit2_Callback(hObject, eventdata, handles)
extension = str2double(get(hObject,'String'));
handles.extension = extension;
guidata(hObject, handles);

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Takes in the information set by the user for the percentage of retraction
%of the actuator
function edit3_Callback(hObject, eventdata, handles)
retract = str2double(get(hObject,'String'));
handles.retract = retract;
guidata(hObject, handles);

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Takes in the information set by the user for the time delay between kicks
function edit4_Callback(hObject, eventdata, handles)
delay = str2double(get(hObject,'String'));
handles.delay = delay;
guidata(hObject, handles);

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Activates the custom profile with all the criterias set by the user
function pushbutton6_Callback(hObject, eventdata, handles)
customprof(handles.numkicks, handles.extension, handles.retract, handles.delay)

%Button to go back to the page with the profiles for both actuators
function pushbutton7_Callback(hObject, eventdata, handles)
close(page1);
home_page;
