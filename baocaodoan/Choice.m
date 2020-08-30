function varargout = Choice(varargin)
% CHOICE MATLAB code for Choice.fig
%      CHOICE, by itself, creates a new CHOICE or raises the existing
%      singleton*.
%
%      H = CHOICE returns the handle to a new CHOICE or the handle to
%      the existing singleton*.
%
%      CHOICE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOICE.M with the given input arguments.
%
%      CHOICE('Property','Value',...) creates a new CHOICE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Choice_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Choice_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Choice

% Last Modified by GUIDE v2.5 11-Jul-2020 20:39:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Choice_OpeningFcn, ...
                   'gui_OutputFcn',  @Choice_OutputFcn, ...
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


% --- Executes just before Choice is made visible.
function Choice_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Choice (see VARARGIN)

% Choose default command line output for Choice
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Choice wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Choice_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in main.
function main_Callback(hObject, eventdata, handles)
% hObject    handle to main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
baocaodoan

% --- Executes on button press in cover.
function cover_Callback(hObject, eventdata, handles)
% hObject    handle to cover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
biadoan
img = imread('C:\Users\DNL Vlogs\Documents\MATLAB\Doan\baocaodoan\logo.jpg');
imshow(img);

% --- Executes on button press in author.
function author_Callback(hObject, eventdata, handles)
% hObject    handle to author (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
author

% --- Executes on button press in user.
function user_Callback(hObject, eventdata, handles)
% hObject    handle to user (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
user
