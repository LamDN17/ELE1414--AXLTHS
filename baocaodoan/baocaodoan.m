function varargout = baocaodoan(varargin)
% BAOCAODOAN MATLAB code for baocaodoan.fig
%      BAOCAODOAN, by itself, creates about new BAOCAODOAN or raises the existing
%      singleton*.
%
%      H = BAOCAODOAN returns the handle to about new BAOCAODOAN or the handle to
%      the existing singleton*.
%
%      BAOCAODOAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BAOCAODOAN.M with the given input arguments.
%
%      BAOCAODOAN('Property','Value',...) creates about new BAOCAODOAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before baocaodoan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to baocaodoan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help baocaodoan

% Last Modified by GUIDE v2.5 11-Jul-2020 10:28:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @baocaodoan_OpeningFcn, ...
                   'gui_OutputFcn',  @baocaodoan_OutputFcn, ...
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


% --- Executes just before baocaodoan is made visible.
function baocaodoan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to baocaodoan (see VARARGIN)

% Choose default command line output for baocaodoan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes baocaodoan wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global number;
number = 0;

% --- Outputs from this function are returned to the command line.
function varargout = baocaodoan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in on_off.
function on_off_Callback(hObject, eventdata, handles)
% hObject    handle to on_off (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('Would you like close?', ...
	'Choice menu', ...
	'Yes','No','No');
switch choice
    case 'Yes'
        close
    case 'No'
end

% --- Executes on button press in path.
function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[ten duongdan] = uigetfile('*.wav','Select the text file');
full = strcat(duongdan, ten);
disp(full);
set(handles.duongdan,'string',full)
guidata(hObject,handles)

global number;
global signal;
global cut_signal;
global power_div;
global data;

[data,Fs] = audioread(full);
% [cut_signal,number,power_div] = main_function(data,Fs);
% 
% set(handles.sohienthi,'string',num2str(number));

% --- Executes on button press in vedothi.
function vedothi_Callback(hObject, eventdata, handles)
% hObject    handle to vedothi (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global data;
global cut_signal;
global power_div;

Fs =44100;

sig_f = abs(real(fftshift(fft(data))));
cut_f = abs(real(fftshift(fft(cut_signal))));
luachon = get(handles.luachon,'value');
batluoi = get(handles.cb,'value');

switch luachon
    case 1
axes(handles.axes1);
N = length(sig_f);
w1 =(-N/2+1:(N/2));
w11 = w1.*Fs/N;
plot(w11,sig_f) % abs lay bien do cua so phuc, dich tan so ve trung tam
title('Tin hieu ban dau');
xlabel('f');
ylabel('A(f)');
if batluoi == 1
    grid on;
else
    grid off;
end
    case 2
axes(handles.axes1);
N2 = length(cut_f);
w2 =(-N2/2+1:(N2/2));
w22 = w2.*Fs/N2;
plot(w22,cut_f)
title('Tin hieu sau khi loc va cat');
xlabel('f');
ylabel('A(f)');
if batluoi == 1
    grid on;
else
    grid off;
end
    case 3
axes(handles.axes1);
plot(power_div)
title('Nang luong sau khi phan bang');
if batluoi == 1
    grid on;
else
    grid off;
end

end

% --- Executes on selection change in luachon.
function luachon_Callback(hObject, eventdata, handles)
% hObject    handle to luachon (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns luachon contents as cell array
%        contents{get(hObject,'Value')} returns selected item from luachon


% --- Executes during object creation, after setting all properties.
function luachon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to luachon (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have about white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cb.
function cb_Callback(hObject, eventdata, handles)
% hObject    handle to cb (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.duongdan,'string','');
set(handles.axes1,'visible','off');
set(handles.sohienthi,'string','');
cla;

% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function cut_Callback(hObject, eventdata, handles)
% hObject    handle to cut (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cut_signal
soundsc(cut_signal,44100);

% --------------------------------------------------------------------
function speak_Callback(hObject, eventdata, handles)
% hObject    handle to speak (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data
soundsc(data,44100);

% --------------------------------------------------------------------
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('Would you like quit?', ...
	'Choice menu', ...
	'Yes','No','No');
switch choice
    case 'Yes'
        close
    case 'No'
end

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in about future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
biadoan
img = imread('C:\Users\DNL Vlogs\Documents\MATLAB\Doan\baocaodoan\logo.jpg');
imshow(img);



% --- Executes on button press in record.
function record_Callback(hObject, eventdata, handles)
% hObject    handle to record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data
global cut_signal
global power_div
global number;
Fs =44100;
% set(handles.duongdan,'string','Speak into the microphone after 3 seconds')
% pause(1);
% set(handles.duongdan,'string','Speak into the microphone after 1 seconds')
% pause(1);
% set(handles.duongdan,'string','Please speak into the microphone')
%disp('Start speaking after 4 seconds.')
set(handles.duongdan,'string','Start speaking after 4 seconds')
% pause(0.5);
recorder = audiorecorder(Fs, 16, 1);
pause(1);
recordblocking(recorder, 5);
disp('End of Recording.');
set(handles.duongdan,'string','Thank you. You have completed the recording')
axes(handles.axes1);
data = getaudiodata(recorder);
plot(data)


% get(recorder)
% 
% recorder = audiorecorder;
% disp('Start speaking.')
% recordblocking(recorder, 10);
% disp('End of Recording.');

% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data
sound(data,44100)


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data
global cut_signal
global power_div
global number;
Fs =44100;
[cut_signal,number,power_div] = main_function(data,Fs);

set(handles.sohienthi,'string',num2str(number));
