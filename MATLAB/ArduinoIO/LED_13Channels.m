function varargout = LED_13Channels(varargin)
% LED_13CHANNELS MATLAB code for LED_13Channels.fig
%      LED_13CHANNELS, by itself, creates a new LED_13CHANNELS or raises the existing
%      singleton*.
%
%      H = LED_13CHANNELS returns the handle to a new LED_13CHANNELS or the handle to
%      the existing singleton*.
%
%      LED_13CHANNELS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LED_13CHANNELS.M with the given input arguments.
%
%      LED_13CHANNELS('Property','Value',...) creates a new LED_13CHANNELS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LED_13Channels_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LED_13Channels_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LED_13Channels

% Last Modified by GUIDE v2.5 07-Apr-2014 13:12:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LED_13Channels_OpeningFcn, ...
                   'gui_OutputFcn',  @LED_13Channels_OutputFcn, ...
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


% --- Executes just before LED_13Channels is made visible.
function LED_13Channels_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LED_13Channels (see VARARGIN)

% Choose default command line output for LED_13Channels
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global seconds_on_13  ;
global seconds_on_12 ;
global seconds_on_11 ;
global seconds_on_10 ;
global seconds_on_9 ;
global seconds_on_8 ;
global seconds_on_7 ;
global seconds_on_6 ;
global seconds_on_5 ;
global seconds_on_4 ;
global seconds_on_3 ;
global seconds_on_2;
global seconds_on_1 ;
global seconds_on_0 ;

seconds_on_13 =0 ;
seconds_on_12 =0;
seconds_on_11 =0;
seconds_on_10 =0;
seconds_on_9 =0;
seconds_on_8 =0;
seconds_on_7 =0;
seconds_on_6 =0;
seconds_on_5 =0;
seconds_on_4 =0;
seconds_on_3 =0;
seconds_on_2 =0;
seconds_on_1 =0;
seconds_on_0 =0;



global brightness1;
global brightness2;
global brightness3;
global brightness4;
global brightness5;
global brightness6;
global brightness7;
global brightness8;
global brightness9;
global brightness10;
global brightness11;
global brightness12;
global brightness13;

brightness1 = 0;
brightness2 = 0;
brightness3 = 0;
brightness4 = 0;
brightness5 = 0;
brightness6 = 0;
brightness7 = 0;
brightness8 = 0;
brightness9 = 0;
brightness10 = 0;
brightness11 = 0;
brightness12 = 0;
brightness13 = 0;




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
%a.pinMode(1,'output');
% UIWAIT makes LED_13Channels wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LED_13Channels_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;


global brightness1;
brightness1 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness1 = 26;
    case 'Brightness 20%'
        brightness1 = 51;
    case 'Brightness 30%'
        brightness1 = 77;
    case 'Brightness 40%'
        brightness1 = 102;
    case 'Brightness 50%'
        brightness1 = 128;
    case 'Brightness 60%'
        brightness1 = 153;
    case 'Brightness 70%'
        brightness1 = 179;
    case 'Brightness 80%'
        brightness1 = 204;
    case 'Brightness 90%'
        brightness1 = 230;
    case 'Brightness 100%'
        brightness1 = 255;
        case 'LED off'
        brightness1 = 0;

    otherwise
        brightness1 = 0;
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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;


global brightness2;
brightness2 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness2 = 26;
    case 'Brightness 20%'
        brightness2 = 51;
    case 'Brightness 30%'
        brightness2 = 77;
    case 'Brightness 40%'
        brightness2 = 102;
    case 'Brightness 50%'
        brightness2 = 128;
    case 'Brightness 60%'
        brightness2 = 153;
    case 'Brightness 70%'
        brightness2 = 179;
    case 'Brightness 80%'
        brightness2 = 204;
    case 'Brightness 90%'
        brightness2 = 230;
    case 'Brightness 100%'
        brightness2 = 255;
        case 'LED off'
        brightness2 = 0;

    otherwise
        brightness9 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;

global brightness3;
brightness3 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness3 = 26;
    case 'Brightness 20%'
        brightness3 = 51;
    case 'Brightness 30%'
        brightness3 = 77;
    case 'Brightness 40%'
        brightness3 = 102;
    case 'Brightness 50%'
        brightness3 = 128;
    case 'Brightness 60%'
        brightness3 = 153;
    case 'Brightness 70%'
        brightness3 = 179;
    case 'Brightness 80%'
        brightness3 = 204;
    case 'Brightness 90%'
        brightness3 = 230;
    case 'Brightness 100%'
        brightness3 = 255;
        case 'LED off'
        brightness3 = 0;

    otherwise
        brightness3 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;


global brightness4;
brightness4 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness4 = 26;
    case 'Brightness 20%'
        brightness4 = 51;
    case 'Brightness 30%'
        brightness4 = 77;
    case 'Brightness 40%'
        brightness4 = 102;
    case 'Brightness 50%'
        brightness4 = 128;
    case 'Brightness 60%'
        brightness4 = 153;
    case 'Brightness 70%'
        brightness4 = 179;
    case 'Brightness 80%'
        brightness4 = 204;
    case 'Brightness 90%'
        brightness4 = 230;
    case 'Brightness 100%'
        brightness4 = 255;
        case 'LED off'
        brightness4 = 0;

    otherwise
        brightness4 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;

global brightness5;
brightness5 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness5 = 26;
    case 'Brightness 20%'
        brightness5 = 51;
    case 'Brightness 30%'
        brightness5 = 77;
    case 'Brightness 40%'
        brightness5 = 102;
    case 'Brightness 50%'
        brightness5 = 128;
    case 'Brightness 60%'
        brightness5 = 153;
    case 'Brightness 70%'
        brightness5 = 179;
    case 'Brightness 80%'
        brightness5 = 204;
    case 'Brightness 90%'
        brightness5 = 230;
    case 'Brightness 100%'
        brightness5 = 255;
        case 'LED off'
        brightness5 = 0;

    otherwise
        brightness5 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;


global brightness6;
brightness6 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness6 = 26;
    case 'Brightness 20%'
        brightness6 = 51;
    case 'Brightness 30%'
        brightness6 = 77;
    case 'Brightness 40%'
        brightness6 = 102;
    case 'Brightness 50%'
        brightness6 = 128;
    case 'Brightness 60%'
        brightness6 = 153;
    case 'Brightness 70%'
        brightness6 = 179;
    case 'Brightness 80%'
        brightness6 = 204;
    case 'Brightness 90%'
        brightness6 = 230;
    case 'Brightness 100%'
        brightness6 = 255;
        case 'LED off'
        brightness6 = 0;

    otherwise
        brightness6 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;


global brightness7;
brightness7 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness7 = 26;
    case 'Brightness 20%'
        brightness7 = 51;
    case 'Brightness 30%'
        brightness7 = 77;
    case 'Brightness 40%'
        brightness7 = 102;
    case 'Brightness 50%'
        brightness7 = 128;
    case 'Brightness 60%'
        brightness7 = 153;
    case 'Brightness 70%'
        brightness7 = 179;
    case 'Brightness 80%'
        brightness7 = 204;
    case 'Brightness 90%'
        brightness7 = 230;
    case 'Brightness 100%'
        brightness7 = 255;
        case 'LED off'
        brightness7 = 0;

    otherwise
        brightness7 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;


global brightness8;
brightness8 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness8 = 26;
    case 'Brightness 20%'
        brightness8 = 51;
    case 'Brightness 30%'
        brightness8 = 77;
    case 'Brightness 40%'
        brightness8 = 102;
    case 'Brightness 50%'
        brightness8 = 128;
    case 'Brightness 60%'
        brightness8 = 153;
    case 'Brightness 70%'
        brightness8 = 179;
    case 'Brightness 80%'
        brightness8 = 204;
    case 'Brightness 90%'
        brightness8 = 230;
    case 'Brightness 100%'
        brightness8 = 255;
        case 'LED off'
        brightness8 = 0;

    otherwise
        brightness8 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;


global brightness9;

brightness9 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness9 = 26;
    case 'Brightness 20%'
        brightness9 = 51;
    case 'Brightness 30%'
        brightness9 = 77;
    case 'Brightness 40%'
        brightness9 = 102;
    case 'Brightness 50%'
        brightness9 = 128;
    case 'Brightness 60%'
        brightness9 = 153;
    case 'Brightness 70%'
        brightness9 = 179;
    case 'Brightness 80%'
        brightness9 = 204;
    case 'Brightness 90%'
        brightness9 = 230;
    case 'Brightness 100%'
        brightness9 = 255;
        case 'LED off'
        brightness9 = 0;

    otherwise
        brightness9 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9


% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;

global brightness10;
brightness10 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness10 = 26;
    case 'Brightness 20%'
        brightness10 = 51;
    case 'Brightness 30%'
        brightness10 = 77;
    case 'Brightness 40%'
        brightness10 = 102;
    case 'Brightness 50%'
        brightness10 = 128;
    case 'Brightness 60%'
        brightness10 = 153;
    case 'Brightness 70%'
        brightness10 = 179;
    case 'Brightness 80%'
        brightness10 = 204;
    case 'Brightness 90%'
        brightness10 = 230;
    case 'Brightness 100%'
        brightness10 = 255;
        case 'LED off'
        brightness10 = 0;

    otherwise
        brightness10 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu10


% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu11.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;

global brightness11;
brightness11 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness11 = 26;
    case 'Brightness 20%'
        brightness11 = 51;
    case 'Brightness 30%'
        brightness11 = 77;
    case 'Brightness 40%'
        brightness11 = 102;
    case 'Brightness 50%'
        brightness11 = 128;
    case 'Brightness 60%'
        brightness11 = 153;
    case 'Brightness 70%'
        brightness11 = 179;
    case 'Brightness 80%'
        brightness11 = 204;
    case 'Brightness 90%'
        brightness11 = 230;
    case 'Brightness 100%'
        brightness11 = 255;
        case 'LED off'
        brightness11 = 0;

    otherwise
        brightness11 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu11


% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu12.
function popupmenu12_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;

global brightness12;
brightness12 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness12 = 26;
    case 'Brightness 20%'
        brightness12 = 51;
    case 'Brightness 30%'
        brightness12 = 77;
    case 'Brightness 40%'
        brightness12 = 102;
    case 'Brightness 50%'
        brightness12 = 128;
    case 'Brightness 60%'
        brightness12 = 153;
    case 'Brightness 70%'
        brightness12 = 179;
    case 'Brightness 80%'
        brightness12 = 204;
    case 'Brightness 90%'
        brightness12 = 230;
    case 'Brightness 100%'
        brightness12 = 255;
        case 'LED off'
        brightness12 = 0;

    otherwise
        brightness12 = 0;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu12


% --- Executes during object creation, after setting all properties.
function popupmenu12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu13.
function popupmenu13_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
stringselected = contents{get(hObject,'Value')};

global a;
global brightness13;
brightness13 = 0;
switch stringselected
    case 'Brightness 10%'
        brightness13 = 26;
    case 'Brightness 20%'
        brightness13 = 51;
    case 'Brightness 30%'
        brightness13 = 77;
    case 'Brightness 40%'
        brightness13 = 102;
    case 'Brightness 50%'
        brightness13 = 128;
    case 'Brightness 60%'
        brightness13 = 153;
    case 'Brightness 70%'
        brightness13 = 179;
    case 'Brightness 80%'
        brightness13 = 204;
    case 'Brightness 90%'
        brightness13 = 230;
    case 'Brightness 100%'
        brightness13 = 255;
        case 'LED off'
        brightness13 = 0;

    otherwise
        brightness13 = 0;
        
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu13 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu13


% --- Executes during object creation, after setting all properties.
function popupmenu13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_1;
seconds_on_1= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_2;
seconds_on_2= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_3;
seconds_on_3= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_4;
seconds_on_4= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_5;
seconds_on_5= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_6;
seconds_on_6= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_7;
seconds_on_7= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_8;
seconds_on_8= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_9;
seconds_on_9= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_10;
seconds_on_10= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_11;
seconds_on_11= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_12;
seconds_on_12= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_13;
seconds_on_13= input('Enter the amount of seconds you want the LEDs on per hour:');


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds_on_13;
global seconds_on_12;
global seconds_on_11;
global seconds_on_10;
global seconds_on_9;
global seconds_on_8;
global seconds_on_7;
global seconds_on_6;
global seconds_on_5;
global seconds_on_4;
global seconds_on_3;
global seconds_on_2;
global seconds_on_1;
global seconds_on_0;
global a;

global brightness1;
global brightness2;
global brightness3;
global brightness4;
global brightness5;
global brightness6;
global brightness7;
global brightness8;
global brightness9;
global brightness10;
global brightness11;
global brightness12;
global brightness13;


total_period = input('Enter total time period in seconds:');
ports = [2 3 4 5 6 7 8 9 10 11 12 13];
periods = [seconds_on_2 seconds_on_3 seconds_on_4 seconds_on_5 seconds_on_6 seconds_on_7 seconds_on_8 seconds_on_9 seconds_on_10 seconds_on_11 seconds_on_12 seconds_on_13];
total = [periods; ports];
[Y,I]=sort(total(1,:));
total_sorted=total(:,I); %use the column indices from sort() to sort all columns of A.

brightness = [brightness2 brightness3 brightness4 brightness5 brightness6 brightness7 brightness8 brightness9 brightness10 brightness11 brightness12 brightness13]; 
disp(brightness)
%Change 1:10 to number of hours they want the program to run
for (i=1:10)
        %Turn on all LEDs


a.analogWrite(13,brightness13);
a.analogWrite(12,brightness12);
a.analogWrite(11,brightness11);
a.analogWrite(10,brightness10);
a.analogWrite(9,brightness9);
a.analogWrite(8,brightness8);
a.analogWrite(7,brightness7);
a.analogWrite(6,brightness6);
a.analogWrite(5,brightness5);
a.analogWrite(4,brightness4);
a.analogWrite(3,brightness3);
a.analogWrite(2,brightness2);



pause(total_sorted(1,1));
a.digitalWrite(total_sorted(2,1),0);

pause(total_sorted(1,2)-total_sorted(1,1));
a.digitalWrite(total_sorted(2,2),0);

pause(total_sorted(1,3)-total_sorted(1,2));
a.digitalWrite(total_sorted(2,3),0);

pause(total_sorted(1,4)-total_sorted(1,3));
a.digitalWrite(total_sorted(2,4),0);

pause(total_sorted(1,5)-total_sorted(1,4));
a.digitalWrite(total_sorted(2,5),0);

pause(total_sorted(1,6)-total_sorted(1,5));
a.digitalWrite(total_sorted(2,6),0);

pause(total_sorted(1,7)-total_sorted(1,6));
a.digitalWrite(total_sorted(2,7),0);

pause(total_sorted(1,8)-total_sorted(1,7));
a.digitalWrite(total_sorted(2,8),0);

pause(total_sorted(1,9)-total_sorted(1,8));
a.digitalWrite(total_sorted(2,9),0);

pause(total_sorted(1,10)-total_sorted(1,9));
a.digitalWrite(total_sorted(2,10),0);

pause(total_sorted(1,11)-total_sorted(1,10));
a.digitalWrite(total_sorted(2,11),0);

pause(total_sorted(1,12)-total_sorted(1,11));
a.digitalWrite(total_sorted(2,12),0);


pause(total_period-total_sorted(1,12));
end    


