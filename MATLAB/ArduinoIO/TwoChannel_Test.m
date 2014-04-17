function varargout = TwoChannel_Test(varargin)
% TWOCHANNEL_TEST MATLAB code for TwoChannel_Test.fig
%      TWOCHANNEL_TEST, by itself, creates a new TWOCHANNEL_TEST or raises the existing
%      singleton*.
%
%      H = TWOCHANNEL_TEST returns the handle to a new TWOCHANNEL_TEST or the handle to
%      the existing singleton*.
%
%      TWOCHANNEL_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TWOCHANNEL_TEST.M with the given input arguments.
%
%      TWOCHANNEL_TEST('Property','Value',...) creates a new TWOCHANNEL_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TwoChannel_Test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TwoChannel_Test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TwoChannel_Test

% Last Modified by GUIDE v2.5 03-Feb-2014 15:58:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TwoChannel_Test_OpeningFcn, ...
                   'gui_OutputFcn',  @TwoChannel_Test_OutputFcn, ...
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


% --- Executes just before TwoChannel_Test is made visible.
function TwoChannel_Test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TwoChannel_Test (see VARARGIN)

% Choose default command line output for TwoChannel_Test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
clear a;
global a;
a = arduino('COM4');
a.pinMode(13,'output');
a.pinMode(12,'output');
a.pinMode(11,'output');

% UIWAIT makes TwoChannel_Test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TwoChannel_Test_OutputFcn(hObject, eventdata, handles) 
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
fprintf('If you want the LEDs always on, enter any value over 3600')
seconds_on = input('Enter the amount of seconds you want the LEDs on per hour:');
display(seconds_on);

if (seconds_on<5)
for (i=1:5)
a.digitalWrite(13,1);
pause(seconds_on);
a.digitalWrite(13,0);
pause(seconds_on);
end
else
    a.digitalWrite(13,0);
end





% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
a.digitalWrite(12,1);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
a.digitalWrite(11,1);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
a.digitalWrite(12,0);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
brightness = get(hObject,'Value');

a.analogWrite(13,floor(brightness));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
brightness = get(hObject,'Value');

a.analogWrite(12,floor(brightness));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;

switch stringselected
    case 'B0'
        a.analogWrite(13,0);
    case 'B50'
        a.analogWrite(13,50);
            case 'B100'
        a.analogWrite(13,100)
            case 'B150'
        a.analogWrite(13,150)
            case 'B200'
        a.analogWrite(13,200)
            case 'B250'
        a.analogWrite(13,250)
    otherwise
        a.analogWrite(13,0)
end



% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

switch stringselected
    case 'Brightness 0'
        a.analogWrite(12,0);
    case 'Brightness 50'
        a.analogWrite(12,50);
            case 'Brightness 100'
        a.analogWrite(12,100)
            case 'Brightness 150'
        a.analogWrite(12,150)
            case 'Brightness 200'
        a.analogWrite(12,200)
            case 'Brightness 250'
        a.analogWrite(12,250)
    otherwise
        a.analogWrite(12,0)
end
% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
