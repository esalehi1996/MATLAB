function varargout = chap3(varargin)
% CHAP3 MATLAB code for chap3.fig
%      CHAP3, by itself, creates a new CHAP3 or raises the existing
%      singleton*.
%
%      H = CHAP3 returns the handle to a new CHAP3 or the handle to
%      the existing singleton*.
%
%      CHAP3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAP3.M with the given input arguments.
%
%      CHAP3('Property','Value',...) creates a new CHAP3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chap3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chap3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chap3

% Last Modified by GUIDE v2.5 02-Dec-2015 09:49:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chap3_OpeningFcn, ...
                   'gui_OutputFcn',  @chap3_OutputFcn, ...
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


% --- Executes just before chap3 is made visible.
function chap3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chap3 (see VARARGIN)

% Choose default command line output for chap3
handles.output = hObject;
handles.inter.type = 1;
handles.inter.num = 2;
addpath('Numerical/Chap3');
handles.action = 'inter';
handles.inter.mode = 0;
handles.fit.func = 0;
handles.mantissa = 6;

handles.action = 'inter';
handles.text6.String = 'Type Of Interpolation';
handles.pp_type.Visible = 'On';
handles.pp_func.Visible = 'Off';
handles.pp_mode.Visible = 'On';
handles.func_input.Visible = 'On';
handles.text9.Visible = 'On';
handles.text10.Visible = 'On';
handles.inter_action.String = 'Interpolate';

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chap3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chap3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in select_action.
function select_action_Callback(hObject, eventdata, handles)
% hObject    handle to select_action (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns select_action contents as cell array
%        contents{get(hObject,'Value')} returns selected item from select_action
if hObject.Value == 1
    handles.action = 'inter';
    handles.text6.String = 'Type Of Interpolation';
    handles.pp_type.Visible = 'On';
    handles.pp_func.Visible = 'Off';
    handles.pp_mode.Visible = 'On';
    handles.func_input.Visible = 'On';
    handles.text9.Visible = 'On';
    handles.text10.Visible = 'On';
    handles.inter_action.String = 'Interpolate';
else 
    handles.action = 'fit';
    handles.text6.String = 'Function';
    handles.pp_type.Visible = 'Off';
    handles.pp_func.Visible = 'On';
    handles.pp_mode.Visible = 'Off';
    handles.func_input.Visible = 'Off';
    handles.text9.Visible = 'Off';
    handles.text10.Visible = 'Off';
    handles.inter_action.String = 'Curve Fit';
end

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function select_action_CreateFcn(hObject, eventdata, handles)
% hObject    handle to select_action (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_num_of_points_Callback(hObject, eventdata, handles)
% hObject    handle to inter_num_of_points (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_num_of_points as text
%        str2double(get(hObject,'String')) returns contents of inter_num_of_points as a double
handles.inter.num = str2num(get(hObject, 'String'));
for i = 1:12
    if i <= handles.inter.num
        set(findobj( 'Tag', strjoin({'inter_p_', int2str(i)},'') ) , 'Visible', 'On');
    else
        set(findobj( 'Tag', strjoin({'inter_p_', int2str(i)},'') ) , 'Visible', 'Off');
    end
end
if handles.inter.num > 12
    set(hObject, 'String', '12');
end

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function inter_num_of_points_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_num_of_points (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_1_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_1 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_1 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_1_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_1 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_1 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_2_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_2 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_2 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_2_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_2 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_2 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_6_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_6 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_6 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_6_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_6 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_6 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_5_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_5 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_5 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_5_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_5 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_5 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_4_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_4 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_4 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_4_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_4 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_4 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_3_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_3 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_3 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_3_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_3 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_3 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_12_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_12 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_12 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_12_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_12 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_12 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_11_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_11 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_11 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_11_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_11 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_11 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_10_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_10 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_10 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_10_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_10 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_10 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_9_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_9 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_9 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_9_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_9 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_9 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_8_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_8 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_8 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_8_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_8 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_8 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_x_7_Callback(hObject, eventdata, handles)
% hObject    handle to inter_x_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_x_7 as text
%        str2double(get(hObject,'String')) returns contents of inter_x_7 as a double


% --- Executes during object creation, after setting all properties.
function inter_x_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_x_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_y_7_Callback(hObject, eventdata, handles)
% hObject    handle to inter_y_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter_y_7 as text
%        str2double(get(hObject,'String')) returns contents of inter_y_7 as a double


% --- Executes during object creation, after setting all properties.
function inter_y_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inter_y_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pp_type.
function pp_type_Callback(hObject, eventdata, handles)
% hObject    handle to pp_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pp_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pp_type
handles.inter.type = get(hObject, 'Value') - 1;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function pp_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pp_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in inter_action.
function inter_action_Callback(hObject, eventdata, handles)
% hObject    handle to inter_action (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

for i = 1:handles.inter.num
    X(i) = str2num(get(findobj( 'Tag', strjoin({'inter_x_', int2str(i)},'') ), 'String'));
    Y(i) = str2num(get(findobj( 'Tag', strjoin({'inter_y_', int2str(i)},'') ), 'String'));
end
if strcmp(handles.action, 'inter')
    l.plt{1} = [0 0];
    l.legend{1} = 'hoyhhh';
    l.type{1} = 's';
    res = {1 l};
    switch (handles.inter.mode)
        case 0
            [res{1}, res{2}] = functioninterpolation(char(handles.func_input.String), handles.inter.type, handles.mantissa);
        case 1
            [res{1}, res{2}] = functioninterpolationnoy(char(handles.func_input.String), X, handles.inter.type, handles.mantissa);
        case 2
            [res{1}, res{2}] = pointinterpolation(X, Y, handles.inter.num, handles.inter.type, handles.mantissa);
    end
    handles.result.String = char(res{1});
    print(size(res{2}.plt));
    for i = 1:size(res{2}.plt)
        if res{2}.type{i} == 's'
            scatter(handles.axe, res{2}.plt{i}(1), res{2}.plt{i}(2))
        else
            plot(handles.axe, res{2}.plt{i}(1), res{2}.plt{i}(2))
        end
    end
    disp('hoy');
else
    if handles.fit.func <= 4
        handles.result.String = char(curvefitterpoints(X, Y, handles.fit.func, handles.mantissa));
        disp('khar');
    else
        handles.result.String = char(curvefitterpointsnotspecified(X, Y, handles.inter.num, handles.mantissa));
    end
end
stri = handles.result.String;
if length(stri) * handles.result.FontSize > 672
    handles.result.FontSize = 672 / len(stri);
end
guidata(hObject, handles);



function step_input_Callback(hObject, eventdata, handles)
% hObject    handle to step_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step_input as text
%        str2double(get(hObject,'String')) returns contents of step_input as a double


% --- Executes during object creation, after setting all properties.
function step_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in pp_mode.
function pp_mode_Callback(hObject, eventdata, handles)
% hObject    handle to pp_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pp_mode contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pp_mode
handles.inter.mode = hObject.Value - 1;
switch (handles.inter.mode)
    case 0
        handles.func_input.Visible = 'On';
        handles.text10.Visible = 'On';
    case 1
        handles.func_input.Visible = 'On';
        handles.text10.Visible = 'On';
    case 2
        handles.func_input.Visible = 'Off';
        handles.text10.Visible = 'Off';
end

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function pp_mode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pp_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function func_input_Callback(hObject, eventdata, handles)
% hObject    handle to func_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of func_input as text
%        str2double(get(hObject,'String')) returns contents of func_input as a double


% --- Executes during object creation, after setting all properties.
function func_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to func_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pp_func.
function pp_func_Callback(hObject, eventdata, handles)
% hObject    handle to pp_func (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pp_func contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pp_func
handles.fit.func = hObject.Value - 1;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function pp_func_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pp_func (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
