% This is the first page of the GUI contains the names of everyone working
% on this 3rd year project
function varargout = project(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
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

function project_OpeningFcn(hObject, eventdata, handles, varargin)
movegui(gcf,'center')
handles.output = hObject;

guidata(hObject, handles);

function varargout = project_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% Button that takes the user to the second page and closes this window
function pushbutton1_Callback(hObject, eventdata, handles)
close(project);
home_page;
