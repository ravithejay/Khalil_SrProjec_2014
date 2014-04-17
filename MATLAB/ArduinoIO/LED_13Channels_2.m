function varargout = LED_13Channels_2(varargin)
%LED_13CHANNELS_2 M-file for LED_13Channels_2.fig
%      LED_13CHANNELS_2, by itself, creates a new LED_13CHANNELS_2 or raises the existing
%      singleton*.
%
%      H = LED_13CHANNELS_2 returns the handle to a new LED_13CHANNELS_2 or the handle to
%      the existing singleton*.
%
%      LED_13CHANNELS_2('Property','Value',...) creates a new LED_13CHANNELS_2 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to LED_13Channels_2_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      LED_13CHANNELS_2('CALLBACK') and LED_13CHANNELS_2('CALLBACK',hObject,...) call the
%      local function named CALLBACK in LED_13CHANNELS_2.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LED_13Channels_2

% Last Modified by GUIDE v2.5 07-Apr-2014 15:17:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LED_13Channels_2_OpeningFcn, ...
                   'gui_OutputFcn',  @LED_13Channels_2_OutputFcn, ...
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


% --- Executes just before LED_13Channels_2 is made visible.
function LED_13Channels_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for LED_13Channels_2
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


% UIWAIT makes LED_13Channels_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LED_13Channels_2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
