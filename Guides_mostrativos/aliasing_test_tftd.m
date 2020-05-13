function varargout = gui_test_v3(varargin)
% GUI_TEST_V3 MATLAB code for gui_test_v3.fig
%      GUI_TEST_V3, by itself, creates a new GUI_TEST_V3 or raises the existing
%      singleton*.
%
%      H = GUI_TEST_V3 returns the handle to a new GUI_TEST_V3 or the handle to
%      the existing singleton*.
%
%      GUI_TEST_V3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TEST_V3.M with the given input arguments.
%
%      GUI_TEST_V3('Property','Value',...) creates a new GUI_TEST_V3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_test_v3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_test_v3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_test_v3

% Last Modified by GUIDE v2.5 11-May-2020 11:17:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_test_v3_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_test_v3_OutputFcn, ...
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

% --- Executes just before gui_test_v3 is made visible.
function gui_test_v3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_test_v3 (see VARARGIN)

% Choose default command line output for gui_test_v3
handles.output = hObject;
handles.fs = 50e3;  
ts = 1/handles.fs;
handles.n = 0:100;
x = sin(2*pi*500/handles.fs*handles.n);

axes(handles.axes1);
plot(handles.n*0.02,x); grid, xlabel('Time [ms]')
ax1 = gca;
x1.XTickLabel = [0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2];

[xw handles.w] = TFTD(handles.n,x,3);
axes(handles.axes2);
plot(handles.w*handles.fs/2/pi,abs(xw)/length(x)); grid, ylim([0 0.5]), xlabel('Frequency [kHz]'), 
ax2 = gca;
ax2.XTickLabel = [-80 -60 -40 -20 0 20 40 60 80];

% Update handles structure
guidata(hObject, handles);


% This sets up the initial plot - only do when we are invisible
% so window can get raised using gui_test_v3.
if strcmp(get(hObject,'Visible'),'off')
    
end

% UIWAIT makes gui_test_v3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_test_v3_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
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

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    
    if(get(hObject,'Min'))
        handles.f = 0;
    end

    if(get(hObject,'Max'))
        handles.f = 50000;
    end
    handles.f = get(hObject,'Value') * 49.5e3 + 500;
    x = sin(2*pi*handles.n/handles.fs*handles.f);
    
    axes(handles.axes1);
    plot(handles.n*0.02,x); grid, xlabel('Time [ms]'), ylim([-1 1])
    ax1 = gca;
    x1.XTickLabel = [0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2];
    
    xw = TFTD(handles.n,x,3);
    axes(handles.axes2);
    plot(handles.w*handles.fs/2/pi,abs(xw)/length(x)); grid, ylim([0 0.5]), xlabel('Frequency [kHz]'), 
    ax2 = gca;
    ax2.XTickLabel = [-80 -60 -40 -20 0 20 40 60 80];

    string1 = sprintf('%d',round(handles.f));
    set(handles.edit1, 'String', string1);
    

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

    % Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
    handles.f = str2double(get(hObject,'String'));
    x = sin(2*pi*handles.n/handles.fs*handles.f);

    axes(handles.axes1);
    plot(handles.n*0.02,x); grid, xlabel('Time [ms]'), ylim([-1 1])
    ax1 = gca;
    x1.XTickLabel = [0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2];

    xw = TFTD(handles.n,x,3);
    axes(handles.axes2);
    plot(handles.w*handles.fs/2/pi,abs(xw)/length(x)); grid, ylim([0 0.5]), xlabel('Frequency [kHz]'), 
    ax2 = gca;
    ax2.XTickLabel = [-80 -60 -40 -20 0 20 40 60 80];
    
    set(handles.slider2,'Value',(handles.f-500)/49500);


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
