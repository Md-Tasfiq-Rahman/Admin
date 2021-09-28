function varargout = Output(varargin)
% OUTPUT MATLAB code for Output.fig
%      OUTPUT, by itself, creates a new OUTPUT or raises the existing
%      singleton*.
%
%      H = OUTPUT returns the handle to a new OUTPUT or the handle to
%      the existing singleton*.
%
%      OUTPUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OUTPUT.M with the given input arguments.
%
%      OUTPUT('Property','Value',...) creates a new OUTPUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Output_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Output_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Output

% Last Modified by GUIDE v2.5 25-Jul-2021 00:13:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Output_OpeningFcn, ...
    'gui_OutputFcn',  @Output_OutputFcn, ...
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


% --- Executes just before Output is made visible.
function Output_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Output (see VARARGIN)

% Choose default command line output for Output
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Output wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Output_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=getappdata(0,'b');
c=getappdata(0,'c');
V=getappdata(0,'V');
f=getappdata(0,'f');

clip_indicator=getappdata(0,'clip_indicator');
clamp_indicator=getappdata(0,'clamp_indicator');
dc_indicator=getappdata(0,'dc_indicator');
if clip_indicator==1
    clipu=getappdata(0,'clipu');
    clipd=getappdata(0,'clipd');
    if a==1
        if (abs(clipu)>V) || (abs(clipd)>V)||(V<0) || (f<=0)||(clipu<clipd)||clipu==clipd
            axes(handles.schematics);
            j=imread('invalid.png');
            set(handles.edit1,'visible','off');
            set(handles.edit2,'visible','off');
            set(handles.axes2,'visible','off');
            set(handles.axes3,'visible','off');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            imshow(j);
            
            
        elseif abs(clipu)<0.7&&abs(clipd)<0.7
            A=0.7-clipu;
            B=clipd+0.7;
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u));
            x=linspace( 0,2*(1/f),4000);
            y=(V*sin(2*pi*f*x));
            axes(handles.schematics);
            j=imread('clip2.png');
            imshow(j);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(V*sin(2*pi*f*x))*(100000/100001);
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clipu*clipd<0
            A=clipu-0.7;
            B=-1*clipd-0.7;
            
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u));
            x=linspace( 0,2*(1/f),4000);
            y=(V*sin(2*pi*f*x));
            axes(handles.schematics);
            j=imread('clip1.png');
            imshow(j);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(V*sin(2*pi*f*x))*(100000/100001);
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clipu>0 && clipd>=0
            A=clipu-0.7;
            B=clipd+0.7;
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u));
            x=linspace( 0,2*(1/f),4000);
            y=(V*sin(2*pi*f*x));
            axes(handles.schematics);
            j=imread('clip3.png');
            imshow(j);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(V*sin(2*pi*f*x))*(100000/100001);
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clipu<=0&&clipd<0
            A=0.7-clipu;
            B=-0.7-clipd;
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u));
            x=linspace( 0,2*(1/f),4000);
            y=(V*sin(2*pi*f*x));
            axes(handles.schematics);
            j=imread('clip4.png');
            imshow(j);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(V*sin(2*pi*f*x))*(100000/100001);
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
            
        end
        
        
    elseif b==1
        if (abs(clipu)>V) || (abs(clipd)>V)||(V<0) || (f<=0)||(clipu<clipd)||clipu==clipd
            axes(handles.schematics);
            j=imread('invalid.png');
            set(handles.edit1,'visible','off');
            set(handles.edit2,'visible','off');
            set(handles.axes2,'visible','off');
            set(handles.axes3,'visible','off');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            imshow(j);
        elseif abs(clipu)<0.7&&abs(clipd)<0.7
            A=0.7-clipu;
            B=clipd+0.7;
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u));
            
            axes(handles.schematics);
            j=imread('clip2.png');
            imshow(j);
            m=V;
            n=f;
            y=square_wave(m,n);
            x=linspace(0,2*(1/n),4000);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(100000/100001).*y;
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clipu*clipd<0
            A=clipu-0.7;
            B=-1*clipd-0.7;
            
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u));
            
            axes(handles.schematics);
            j=imread('clip1.png');
            imshow(j);
            m=V;
            n=f;
            y=square_wave(m,n);
            x=linspace(0,2*(1/n),4000);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(100000/100001).*y;
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clipu>0 && clipd>=0
            A=clipu-0.7;
            B=clipd+0.7;
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u));
            
            axes(handles.schematics);
            j=imread('clip3.png');
            imshow(j);
            m=V;
            n=f;
            y=square_wave(m,n);
            x=linspace(0,2*(1/n),4000);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(100000/100001).*y;
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clipu<=0&&clipd<0
            A=0.7-clipu;
            B=-0.7-clipd;
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u))
            
            axes(handles.schematics);
            j=imread('clip4.png');
            imshow(j);
            m=V;
            n=f;
            y=square_wave(m,n);
            x=linspace(0,2*(1/n),4000);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(100000/100001).*y;
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
            
        end
        
        
    elseif c==1
        if (abs(clipu)>V) || (abs(clipd)>V)||(V<0) || (f<=0)||(clipu<clipd)||clipu==clipd
            axes(handles.schematics);
            j=imread('invalid.png');
            set(handles.edit1,'visible','off');
            set(handles.edit2,'visible','off');
            set(handles.axes2,'visible','off');
            set(handles.axes3,'visible','off');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            imshow(j);
            
        elseif abs(clipu)<0.7&&abs(clipd)<0.7
            A=0.7-clipu;
            B=clipd+0.7;
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u));
            
            axes(handles.schematics);
            j=imread('clip2.png');
            imshow(j);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            x=linspace(0,2*(1/n),4000);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(100000/100001).*y;
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clipu*clipd<0
            A=clipu-0.7;
            B=-1*clipd-0.7;
            
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u));
            
            axes(handles.schematics);
            j=imread('clip1.png');
            imshow(j);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            x=linspace(0,2*(1/n),4000);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(100000/100001).*y;
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clipu>0 && clipd>=0
            A=clipu-0.7;
            B=clipd+0.7;
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u));
            
            axes(handles.schematics);
            j=imread('clip3.png');
            imshow(j);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            x=linspace(0,2*(1/n),4000);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(100000/100001).*y;
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clipu<=0&&clipd<0
            A=0.7-clipu;
            B=-0.7-clipd;
            set(handles.edit1,'visible','on');
            set(handles.edit2,'visible','on');
            u='V';
            set(handles.edit1,'string',append(num2str(A),u));
            set(handles.edit2,'string',append(num2str(B),u))
            
            axes(handles.schematics);
            j=imread('clip4.png');
            imshow(j);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            x=linspace(0,2*(1/n),4000);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            axes(handles.axes3);
            z=(100000/100001).*y;
            z(z>clipu)=clipu;
            z(z<clipd)=clipd;
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
            
        end
        
    end
    
elseif clamp_indicator==1
    clampu=getappdata(0,'clampu');
    clampd=getappdata(0,'clampd');
    pp=2*V;
    bb=clampu-clampd;
    tol=0.0000000001;
    
    if a==1
        if abs(pp-bb)>tol|| V<0 || f<=0 || clampu<clampd
            axes(handles.schematics);
            set(handles.edit1,'visible','off');
            set(handles.edit2,'visible','off');
            set(handles.axes2,'visible','off');
            set(handles.axes3,'visible','off');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            j=imread('invalid.png');
            imshow(j);
        elseif V<0.7 || V>50
            if clampu>(2*V)
                A=clampd;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp3.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                y=V*sin(2*pi*f*x);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                p=clampu-V;
                z=p+y;
                axes(handles.axes3);
                plot(x,z,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
            elseif clampu<=(2*V)&& clampu>V
                A=-clampd;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp4.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                y=V*sin(2*pi*f*x);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                z=(clampu-V)+y;
                axes(handles.axes3);
                plot(x,z,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
            elseif clampu<=V && clampu>0
                A=clampu;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp1.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                y=V*sin(2*pi*f*x);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                z=(clampu-V)+y;
                axes(handles.axes3);
                plot(x,z,'b-','LineWidth',2);
                ylabel('Output voltage (V)');
                grid on;
                Output
            elseif clampu<=0
                A=-clampu;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp2.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                y=V*sin(2*pi*f*x);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                y=(clampu-V)+y;
                axes(handles.axes3);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
            end
        elseif clampu>(2*V-0.7)
            A=clampd+0.7;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp33.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            y=V*sin(2*pi*f*x);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            p=clampu-V;
            z=p+y;
            axes(handles.axes3);
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clampu<=(2*V-0.7)&& clampu>V
            A=-clampd-0.7;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp44.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            y=V*sin(2*pi*f*x);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            z=(clampu-V)+y;
            axes(handles.axes3);
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clampu<=V && clampu>0.7
            A=clampu-0.7;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp11.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            y=V*sin(2*pi*f*x);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            z=(clampu-V)+y;
            axes(handles.axes3);
            plot(x,z,'b-','LineWidth',2);
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
            grid on;
            
        elseif clampu<=0.7
            A=0.7-clampu;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp22.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            y=V*sin(2*pi*f*x);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=(clampu-V)+y;
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        end
    elseif b==1
        if abs(pp-bb)>tol|| V<0 || f<=0 || clampu<clampd
            axes(handles.schematics);
            set(handles.edit1,'visible','off');
            set(handles.edit2,'visible','off');
            set(handles.axes2,'visible','off');
            set(handles.axes3,'visible','off');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            j=imread('invalid.png');
            imshow(j);
        elseif V<0.7 || V>50
            if clampu>(2*V)
                A=clampd;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp3.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                m=V;
                n=f;
                y=square_wave(m,n);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                p=clampu-V;
                z=p+y;
                axes(handles.axes3);
                plot(x,z,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
            elseif clampu<=(2*V)&& clampu>V
                A=-clampd;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp4.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                m=V;
                n=f;
                y=square_wave(m,n);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                z=(clampu-V)+y;
                axes(handles.axes3);
                plot(x,z,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
            elseif clampu<=V && clampu>0
                
                A=clampu;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp1.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                m=V;
                n=f;
                y=square_wave(m,n);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                z=(clampu-V)+y;
                axes(handles.axes3);
                plot(x,z,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
                
            elseif clampu<=0
                A=-clampu;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp2.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                m=V;
                n=f;
                y=square_wave(m,n);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                y=(clampu-V)+y;
                axes(handles.axes3);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
            end
        elseif clampu>(2*V-0.7)
            A=clampd+0.7;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp33.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=square_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            p=clampu-V;
            z=p+y;
            axes(handles.axes3);
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clampu<=(2*V-0.7)&& clampu>V
            A=-clampd-0.7;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp44.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=square_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            z=(clampu-V)+y;
            axes(handles.axes3);
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clampu<=V && clampu>0.7
            
            A=clampu-0.7;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp11.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=square_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            z=(clampu-V)+y;
            axes(handles.axes3);
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output Voltage (V)');
            
            
        elseif clampu<=0.7
            A=0.7-clampu;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp22.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=square_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=(clampu-V)+y;
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        end
    elseif c==1
        if abs(pp-bb)>tol|| V<0 || f<=0 || clampu<clampd
            axes(handles.schematics);
            set(handles.edit1,'visible','off');
            set(handles.edit2,'visible','off');
            set(handles.axes2,'visible','off');
            set(handles.axes3,'visible','off');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            j=imread('invalid.png');
            imshow(j);
        elseif V<0.7 || V>50
            if clampu>(2*V)
                A=clampd;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp3.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                m=V;
                n=f;
                y=triangular_wave(m,n);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                p=clampu-V;
                z=p+y;
                axes(handles.axes3);
                plot(x,z,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
            elseif clampu<=(2*V)&& clampu>V
                A=-clampd-0;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp4.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                m=V;
                n=f;
                y=triangular_wave(m,n);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                z=(clampu-V)+y;
                axes(handles.axes3);
                plot(x,z,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
            elseif clampu<=V && clampu>0
                A=clampu;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp1.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                m=V;
                n=f;
                y=triangular_wave(m,n);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                z=(clampu-V)+y;
                axes(handles.axes3);
                plot(x,z,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
            elseif clampu<=0
                A=-clampu;
                C=21276595.74/f;
                u='V';
                v='ohm';
                set(handles.edit4,'visible','on');
                set(handles.edit3,'visible','on');
                set(handles.edit4,'string',append(num2str(A),u));
                set(handles.edit3,'string',append(num2str(C),v));
                axes(handles.schematics);
                j=imread('clamp2.png');
                imshow(j);
                x=linspace(0,2*(1/f),4000);
                m=V;
                n=f;
                y=triangular_wave(m,n);
                axes(handles.axes2);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Input voltage (V)');
                y=(clampu-V)+y;
                axes(handles.axes3);
                plot(x,y,'b-','LineWidth',2);
                grid on;
                xlabel('Time (s)');
                ylabel('Output voltage (V)');
            end
        elseif clampu>(2*V-0.7)
            A=clampd+0.7;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp33.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            p=clampu-V;
            z=p+y;
            axes(handles.axes3);
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clampu<=(2*V-0.7)&& clampu>V
            A=-clampd-0.7;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp44.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            z=(clampu-V)+y;
            axes(handles.axes3);
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clampu<=V && clampu>0.7
            A=clampu-0.7;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp11.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            z=(clampu-V)+y;
            axes(handles.axes3);
            plot(x,z,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif clampu<=0.7
            A=0.7-clampu;
            C=21276595.74/f;
            u='V';
            v='ohm';
            set(handles.edit4,'visible','on');
            set(handles.edit3,'visible','on');
            set(handles.edit4,'string',append(num2str(A),u));
            set(handles.edit3,'string',append(num2str(C),v));
            axes(handles.schematics);
            j=imread('clamp22.png');
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=(clampu-V)+y;
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        end
    end
elseif dc_indicator==1
    dc=getappdata(0,'dc');
    if a==1
        if abs(dc)>V || f<=0 || V<0
            axes(handles.schematics);
            j=imread('invalid.png');
            set(handles.edit1,'visible','off');
            set(handles.edit2,'visible','off');
            set(handles.axes2,'visible','off');
            set(handles.axes3,'visible','off');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            imshow(j);
        elseif dc==V
            RL=10638297.87/f;
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(dc),v));
            j=imread('dc2.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            y=V*sin(2*pi*f*x);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc<V && dc>0
            RL=10638297.87/f;
            m=V;
            n=f;
            p=dc;
            Rs=regulated(m,n,p,RL);
            
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            set(handles.edit5,'visible','on');
            v='ohm';
            set(handles.edit5,'string',append(num2str(Rs),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(dc),v));
            j=imread('dc1.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            y=V*sin(2*pi*f*x);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc==0
            RL=1;
            m=V;
            Rs=10;
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            set(handles.edit5,'visible','on');
            v='Megaohm';
            set(handles.edit5,'string',append(num2str(Rs),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(dc),v));
            j=imread('dc1.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            y=V*sin(2*pi*f*x);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc<0 && dc>-V
            RL=10638297.87/f;
            m=V;
            n=f;
            p=dc;
            p=p*-1
            Rs=regulated(m,n,p,RL);
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            set(handles.edit5,'visible','on');
            v='ohm';
            set(handles.edit5,'string',append(num2str(Rs),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(p),v));
            j=imread('dc3.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            y=V*sin(2*pi*f*x);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc==-V
            RL=10638297.87/f;
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            v='V';
            p=-dc
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(p),v));
            j=imread('dc4.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            y=V*sin(2*pi*f*x);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        end
    elseif b==1
        if abs(dc)>V || f<=0 || V<0
            axes(handles.schematics);
            j=imread('invalid.png');
            set(handles.edit1,'visible','off');
            set(handles.edit2,'visible','off');
            set(handles.axes2,'visible','off');
            set(handles.axes3,'visible','off');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            imshow(j);
        elseif dc==V
            RL=10638297.87/f;
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(dc),v));
            j=imread('dc2.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=square_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc<V && dc>0
            RL=10638297.87/f;
            m=V;
            n=f;
            p=dc;
            Rs=regulated(m,n,p,RL);
            
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            set(handles.edit5,'visible','on');
            v='ohm';
            set(handles.edit5,'string',append(num2str(Rs),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(dc),v));
            j=imread('dc1.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=square_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc==0
            RL=1;
            m=V;
            Rs=10;
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            set(handles.edit5,'visible','on');
            v='Megaohm';
            set(handles.edit5,'string',append(num2str(Rs),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(dc),v));
            j=imread('dc1.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=square_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc<0 && dc>-V
            RL=10638297.87/f;
            m=V;
            n=f;
            p=dc;
            p=p*(-1)
            Rs=regulated(m,n,p,RL);
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            set(handles.edit5,'visible','on');
            v='ohm';
            set(handles.edit5,'string',append(num2str(Rs),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(p),v));
            j=imread('dc3.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=square_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc==-V
            RL=10638297.87/f;
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            v='V';
            p=-dc
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(p),v));
            j=imread('dc4.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=square_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        end
    elseif c==1
        if abs(dc)>V || f<=0 || V<0
            axes(handles.schematics);
            j=imread('invalid.png');
            set(handles.edit1,'visible','off');
            set(handles.edit2,'visible','off');
            set(handles.axes2,'visible','off');
            set(handles.axes3,'visible','off');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            imshow(j);
        elseif dc==V
            RL=10638297.87/f;
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(dc),v));
            j=imread('dc2.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc<V && dc>0
            RL=10638297.87/f;
            m=V;
            n=f;
            p=dc;
            Rs=regulated(m,n,p,RL);
            
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            set(handles.edit5,'visible','on');
            v='ohm';
            set(handles.edit5,'string',append(num2str(Rs),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(dc),v));
            j=imread('dc1.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc==0
            RL=1;
            m=V;
            Rs=10;
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            set(handles.edit5,'visible','on');
            v='Megaohm';
            set(handles.edit5,'string',append(num2str(Rs),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(dc),v));
            j=imread('dc1.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc<0 && dc>-V
            RL=10638297.87/f;
            m=V;
            n=f;
            p=dc;
            p=p*(-1)
            Rs=regulated(m,n,p,RL);
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            set(handles.edit5,'visible','on');
            v='ohm';
            set(handles.edit5,'string',append(num2str(Rs),v));
            v='V';
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(p),v));
            j=imread('dc3.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        elseif dc==-V
            RL=10638297.87/f;
            set(handles.edit3,'visible','on');
            v='ohm';
            set(handles.edit3,'string',append(num2str(RL),v));
            v='V';
            p=-dc
            set(handles.edit6,'visible','on');
            set(handles.edit6,'string',append(num2str(p),v));
            j=imread('dc4.png');
            axes(handles.schematics);
            imshow(j);
            x=linspace(0,2*(1/f),4000);
            m=V;
            n=f;
            y=triangular_wave(m,n);
            axes(handles.axes2);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Input voltage (V)');
            y=dc*ones(1,4000);
            axes(handles.axes3);
            plot(x,y,'b-','LineWidth',2);
            grid on;
            xlabel('Time (s)');
            ylabel('Output voltage (V)');
        end
        
    end
    
    
    
    
end












function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clip_indicator=getappdata(0,'clip_indicator');
clamp_indicator=getappdata(0,'clamp_indicator');
dc_indicator=getappdata(0,'dc_indicator');
if clip_indicator==1
    clipper;
    close Output;
elseif clamp_indicator==1
    clamper;
    close Output;
else
    dc_regulator;
    close Output;
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
homepage;
close homepage;
clip_indicator=getappdata(0,'clip_indicator');
clamp_indicator=getappdata(0,'clamp_indicator');
dc_indicator=getappdata(0,'dc_indicator');
if clip_indicator==1
    clipper;
    close clipper;
    close Output;
elseif clamp_indicator==1
    clamper;
    close clamper;
    close Output;
else
    dc_regulator;
    close dc_regulator;
    close Output;
end
