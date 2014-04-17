function varargout = printhello(varargin)
% PRINTHELLO MATLAB code for printhello.fig
%      PRINTHELLO, by itself, creates a new PRINTHELLO or raises the existing
%      singleton*.
%
%      H = PRINTHELLO returns the handle to a new PRINTHELLO or the handle to
%      the existing singleton*.
%
%      PRINTHELLO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRINTHELLO.M with the given input arguments.
%
%      PRINTHELLO('Property','Value',...) creates a new PRINTHELLO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before printhello_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to printhello_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help printhello

% Last Modified by GUIDE v2.5 29-Jan-2014 23:00:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @printhello_OpeningFcn, ...
                   'gui_OutputFcn',  @printhello_OutputFcn, ...
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


% --- Executes just before printhello is made visible.
function printhello_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to printhello (see VARARGIN)

% Choose default command line output for printhello
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes printhello wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = printhello_OutputFcn(hObject, eventdata, handles) 
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
x = [1:10];
y = x.^2;
x
y
figure
plot(x,y)
figure
stem(x,y)