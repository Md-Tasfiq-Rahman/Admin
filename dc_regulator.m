function varargout = dc_regulator(varargin)
% DC_REGULATOR MATLAB code for dc_regulator.fig
%      DC_REGULATOR, by itself, creates a new DC_REGULATOR or raises the existing
%      singleton*.
%
%      H = DC_REGULATOR returns the handle to a new DC_REGULATOR or the handle to
%      the existing singleton*.
%
%      DC_REGULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DC_REGULATOR.M with the given input arguments.
%
%      DC_REGULATOR('Property','Value',...) creates a new DC_REGULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dc_regulator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dc_regulator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dc_regulator

% Last Modified by GUIDE v2.5 23-Jul-2021 05:35:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @dc_regulator_OpeningFcn, ...
    'gui_OutputFcn',  @dc_regulator_OutputFcn, ...
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


% --- Executes just before dc_regulator is made visible.
function dc_regulator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dc_regulator (see VARARGIN)

% Choose default command line output for dc_regulator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dc_regulator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dc_regulator_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function dc_Callback(hObject, eventdata, handles)
% hObject    handle to dc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dc as text
%        str2double(get(hObject,'String')) returns contents of dc as a double


% --- Executes during object creation, after setting all properties.
function dc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
homepage;
close dc_regulator;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
q=str2num(get(handles.dc,'string'));
if length(q)==0
    s='Please give input';
    set(handles.dc,'string',s);
else
    dc=str2double(get(handles.dc,'string'));
    setappdata(0,'dc',dc);
    clip_indicator=0;
    clamp_indicator=0;
    dc_indicator=1;
    setappdata(0,'clip_indicator',clip_indicator);
    setappdata(0,'clamp_indicator',clamp_indicator);
    setappdata(0,'dc_indicator',dc_indicator);
    Output;
end
