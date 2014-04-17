function varargout = TestLED2(varargin)
% TESTLED2 MATLAB code for TestLED2.fig
%      TESTLED2, by itself, creates a new TESTLED2 or raises the existing
%      singleton*.
%
%      H = TESTLED2 returns the handle to a new TESTLED2 or the handle to
%      the existing singleton*.
%
%      TESTLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTLED2.M with the given input arguments.
%
%      TESTLED2('Property','Value',...) creates a new TESTLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TestLED2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TestLED2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TestLED2

% Last Modified by GUIDE v2.5 26-Jan-2014 21:15:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TestLED2_OpeningFcn, ...
                   'gui_OutputFcn',  @TestLED2_OutputFcn, ...
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


% --- Executes just before TestLED2 is made visible.
function TestLED2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TestLED2 (see VARARGIN)

% Choose default command line output for TestLED2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TestLED2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clear a;
global a;
a = arduino('COM4');
a.pinMode(13,'output');

% --- Outputs from this function are returned to the command line.
function varargout = TestLED2_OutputFcn(hObject, eventdata, handles) 
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
global a;
a.analogWrite(13,50);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
a.digitalWrite(13,0);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global a;
brightness = get(hObject,'Value');

a.analogWrite(13,floor(brightness));




% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
