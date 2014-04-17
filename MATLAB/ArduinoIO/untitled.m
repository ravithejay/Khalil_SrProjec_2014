function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 05-Feb-2014 14:20:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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





% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;
global seconds_on_13;
global seconds_on_12;

% Update handles structure
guidata(hObject, handles);
clear a;
global a;
a = arduino('COM4');
a.pinMode(13,'output');
a.pinMode(12,'output');
a.pinMode(11,'output');
a.pinMode(10,'output');
a.pinMode(9,'output');
a.pinMode(8,'output');
a.pinMode(7,'output');
a.pinMode(6,'output');
a.pinMode(5,'output');
a.pinMode(4,'output');
a.pinMode(3,'output');
a.pinMode(2,'output');
% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
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
fprintf('If you want the LEDs always on, enter any value over 3600')
global seconds_on_13;
global seconds_on_12;
seconds_on_13 = input('Enter the amount of seconds you want the Port 13 on per hour:');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf('If you want the LEDs always on, enter any value over 3600')
global seconds_on_13;
global seconds_on_12;
seconds_on_12= input('Enter the amount of seconds you want the LEDs on per hour:');




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global seconds_on_13;
global seconds_on_12;
global seconds_on_11;
total_period = input('Enter total time period in seconds:');

ports = [9 12 13];
periods = [seconds_on_11 seconds_on_12 seconds_on_13];
total = [periods; ports];
[Y,I]=sort(total(1,:));
total_sorted=total(:,I); %use the column indices from sort() to sort all columns of A.
disp(total_sorted);

for (i=1:10)
        %Turn on all LEDs
a.digitalWrite(12,1);
a.digitalWrite(13,1);
a.digitalWrite(9,1);

pause(total_sorted(1,1));
a.digitalWrite(total_sorted(2,1),0);

pause(total_sorted(1,2)-total_sorted(1,1));
a.digitalWrite(total_sorted(2,2),0);

pause(total_sorted(1,3)-total_sorted(1,2));
a.digitalWrite(total_sorted(2,3),0);


pause(total_period-total_sorted(1,3));
end    



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global seconds_on_11;
seconds_on_11 = input('Enter the amount of seconds you want the Port 13 on per hour:');
