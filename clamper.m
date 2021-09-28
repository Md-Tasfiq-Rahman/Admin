function varargout = clamper(varargin)
% CLAMPER MATLAB code for clamper.fig
%      CLAMPER, by itself, creates a new CLAMPER or raises the existing
%      singleton*.
%
%      H = CLAMPER returns the handle to a new CLAMPER or the handle to
%      the existing singleton*.
%
%      CLAMPER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLAMPER.M with the given input arguments.
%
%      CLAMPER('Property','Value',...) creates a new CLAMPER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before clamper_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to clamper_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help clamper

% Last Modified by GUIDE v2.5 19-Jul-2021 11:02:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @clamper_OpeningFcn, ...
    'gui_OutputFcn',  @clamper_OutputFcn, ...
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


% --- Executes just before clamper is made visible.
function clamper_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to clamper (see VARARGIN)

% Choose default command line output for clamper
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes clamper wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = clamper_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function clampup_Callback(hObject, eventdata, handles)
% hObject    handle to clampup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of clampup as text
%        str2double(get(hObject,'String')) returns contents of clampup as a double


% --- Executes during object creation, after setting all properties.
function clampup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to clampup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function clampdown_Callback(hObject, eventdata, handles)
% hObject    handle to clampdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of clampdown as text
%        str2double(get(hObject,'String')) returns contents of clampdown as a double


% --- Executes during object creation, after setting all properties.
function clampdown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to clampdown (see GCBO)
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
q=str2num(get(handles.clampup,'string'));
r=str2num(get(handles.clampdown,'string'));
if length(r)==0 && length(q)==0
    s='Please give input';
    set(handles.clampup,'string',s);
    s='Please give input';
    set(handles.clampdown,'string',s);
    
elseif length(r)==0
    s='Please give input';
    set(handles.clampdown,'string',s);
elseif  length(q)==0
    s='Please give input';
    set(handles.clampup,'string',s);
else
    clampu=str2double(get(handles.clampup,'string'));
    clampd=str2double(get(handles.clampdown,'string'));
    setappdata(0,'clampu',clampu);
    setappdata(0,'clampd',clampd);
    clip_indicator=0;
    clamp_indicator=1;
    dc_indicator=0;
    setappdata(0,'clip_indicator',clip_indicator);
    setappdata(0,'clamp_indicator',clamp_indicator);
    setappdata(0,'dc_indicator',dc_indicator);
    Output;
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
homepage;
close clamper;
