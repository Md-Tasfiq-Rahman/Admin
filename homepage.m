function varargout = homepage(varargin)
%HOMEPAGE MATLAB code file for homepage.fig
%      HOMEPAGE, by itself, creates a new HOMEPAGE or raises the existing
%      singleton*.
%
%      H = HOMEPAGE returns the handle to a new HOMEPAGE or the handle to
%      the existing singleton*.
%
%      HOMEPAGE('Property','Value',...) creates a new HOMEPAGE using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to homepage_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      HOMEPAGE('CALLBACK') and HOMEPAGE('CALLBACK',hObject,...) call the
%      local function named CALLBACK in HOMEPAGE.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help homepage

% Last Modified by GUIDE v2.5 24-Jul-2021 15:36:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @homepage_OpeningFcn, ...
    'gui_OutputFcn',  @homepage_OutputFcn, ...
    'gui_LayoutFcn',  [], ...
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


% --- Executes just before homepage is made visible.
function homepage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for homepage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes homepage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = homepage_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function freq_Callback(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq as text
%        str2double(get(hObject,'String')) returns contents of freq as a double


% --- Executes during object creation, after setting all properties.
function freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function peak_Callback(hObject, eventdata, handles)
% hObject    handle to peak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of peak as text
%        str2double(get(hObject,'String')) returns contents of peak as a double


% --- Executes during object creation, after setting all properties.
function peak_CreateFcn(hObject, eventdata, handles)
% hObject    handle to peak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in back1.
function back1_Callback(hObject, eventdata, handles)
% hObject    handle to back1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panel2,'visible','off');
set(handles.panel1,'visible','on');

% --- Executes on button press in next2.
function next2_Callback(hObject, eventdata, handles)
% hObject    handle to next2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

q=str2num(get(handles.peak,'string'));
r=str2num(get(handles.freq,'string'));
if length(r)==0 && length(q)==0
    s='Please give input';
    set(handles.peak,'string',s);
    s='Please give input';
    set(handles.freq,'string',s);
    
elseif length(r)==0
    s='Please give input';
    set(handles.freq,'string',s);
elseif  length(q)==0
    s='Please give input';
    set(handles.peak,'string',s);
    
else
    V=str2double(get(handles.peak,'string'));
    f=str2double(get(handles.freq,'string'));
    setappdata(0,'V',V);
    setappdata(0,'f',f);
    set(handles.panel2,'visible','off');
    set(handles.panel3,'visible','on');
end

% --- Executes on button press in clip.
function clip_Callback(hObject, eventdata, handles)
% hObject    handle to clip (see GCBO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    )
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clipper;


% --- Executes on button press in clamp.
function clamp_Callback(hObject, eventdata, handles)
% hObject    handle to clamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clamper;

% --- Executes on button press in dc.
function dc_Callback(hObject, eventdata, handles)
% hObject    handle to dc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dc_regulator;

% --- Executes on button press in back2.
function back2_Callback(hObject, eventdata, handles)
% hObject    handle to back2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panel3,'visible','off');
set(handles.panel2,'visible','on');

% --- Executes on button press in sin.
function sin_Callback(hObject, eventdata, handles)
% hObject    handle to sin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sin


% --- Executes on button press in sqr.
function sqr_Callback(hObject, eventdata, handles)
% hObject    handle to sqr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sqr


% --- Executes on button press in trig.
function trig_Callback(hObject, eventdata, handles)
% hObject    handle to trig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of trig


% --- Executes on button press in next1.
function next1_Callback(hObject, eventdata, handles)
% hObject    handle to next1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
b=0;
c=0;
if get(handles.sin,'value')==get(handles.sin,'max')
    a=1;
    b=0;
    c=0;
elseif get(handles.sqr,'value')==get(handles.sqr,'max')
    b=1;
    a=0;
    c=0;
elseif get(handles.trig,'value')==get(handles.trig,'max')
    c=1;
    a=0;
    b=0;
end
setappdata(0,'a',a);
setappdata(0,'b',b);
setappdata(0,'c',c);
set(handles.panel1,'visible','off');
set(handles.panel2,'visible','on');





% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close homepage;
