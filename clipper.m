function varargout = clipper(varargin)
% CLIPPER MATLAB code for clipper.fig
%      CLIPPER, by itself, creates a new CLIPPER or raises the existing
%      singleton*.
%
%      H = CLIPPER returns the handle to a new CLIPPER or the handle to
%      the existing singleton*.
%
%      CLIPPER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLIPPER.M with the given input arguments.
%
%      CLIPPER('Property','Value',...) creates a new CLIPPER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before clipper_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to clipper_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help clipper

% Last Modified by GUIDE v2.5 24-Jul-2021 16:25:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @clipper_OpeningFcn, ...
    'gui_OutputFcn',  @clipper_OutputFcn, ...
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


% --- Executes just before clipper is made visible.
function clipper_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to clipper (see VARARGIN)

% Choose default command line output for clipper
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes clipper wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = clipper_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function clipup_Callback(hObject, eventdata, handles)
% hObject    handle to clipup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of clipup as text
%        str2double(get(hObject,'String')) returns contents of clipup as a double


% --- Executes during object creation, after setting all properties.
function clipup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to clipup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function clipdown_Callback(hObject, eventdata, handles)
% hObject    handle to clipdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of clipdown as text
%        str2double(get(hObject,'String')) returns contents of clipdown as a double


% --- Executes during object creation, after setting all properties.
function clipdown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to clipdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in next3.
function next3_Callback(hObject, eventdata, handles)
% hObject    handle to next3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
q=str2num(get(handles.clipup,'string'));
r=str2num(get(handles.clipdown,'string'));
if length(r)==0 && length(q)==0
    s='Please give input';
    set(handles.clipup,'string',s);
    s='Please give input';
    set(handles.clipdown,'string',s);
    
elseif length(r)==0
    s='Please give input';
    set(handles.clipdown,'string',s);
elseif  length(q)==0
    s='Please give input';
    set(handles.clipup,'string',s);
else
    clipu=str2double(get(handles.clipup,'string'));
    clipd=str2double(get(handles.clipdown,'string'));
    setappdata(0,'clipu',clipu);
    setappdata(0,'clipd',clipd);
    clip_indicator=1;
    clamp_indicator=0;
    dc_indicator=0;
    setappdata(0,'clip_indicator',clip_indicator);
    setappdata(0,'clamp_indicator',clamp_indicator);
    setappdata(0,'dc_indicator',dc_indicator);
    Output;
end



% --- Executes on button press in back3.
function back3_Callback(hObject, eventdata, handles)
% hObject    handle to back3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
homepage;
close clipper;
