function varargout = Chap4(varargin)
% CHAP4 MATLAB code for Chap4.fig
%      CHAP4, by itself, creates a new CHAP4 or raises the existing
%      singleton*.
%
%      H = CHAP4 returns the handle to a new CHAP4 or the handle to
%      the existing singleton*.
%
%      CHAP4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAP4.M with the given input arguments.
%
%      CHAP4('Property','Value',...) creates a new CHAP4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Chap4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Chap4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Chap4

% Last Modified by GUIDE v2.5 06-Jan-2016 04:43:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Chap4_OpeningFcn, ...
                   'gui_OutputFcn',  @Chap4_OutputFcn, ...
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


% --- Executes just before Chap4 is made visible.
function Chap4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Chap4 (see VARARGIN)

% Choose default command line output for Chap4
handles.output = hObject;

handles.edit11.Visible = 'Off';
handles.edit12.Visible = 'Off';
handles.edit13.Visible = 'Off';
handles.edit14.Visible = 'Off';


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Chap4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Chap4_OutputFcn(hObject, eventdata, handles) 
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

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
if hObject.Value == 6
    handles.edit11.Visible = 'On';
    handles.edit12.Visible = 'On';
    handles.edit13.Visible = 'On';
    handles.edit14.Visible = 'On';
    handles.edit3.Visible = 'Off';
    handles.edit2.Visible = 'Off';
else
    handles.edit11.Visible = 'Off';
    handles.edit12.Visible = 'Off';
    handles.edit13.Visible = 'Off';
    handles.edit14.Visible = 'Off';
    handles.edit3.Visible = 'On';
    handles.edit2.Visible = 'On';
end

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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs = get(handles.edit1, 'string');
f = inline(fs);
a = str2double(get(handles.edit3, 'string'));
b = str2double(get(handles.edit2, 'string'));
h = str2double(get(handles.edit4, 'string'));
cla;
hold on;

X = linspace(a,b,1000);
Y = f(X);
fill([X(1) X X(size(X,2))], [0 Y 0], 'y');

switch get(handles.popupmenu1, 'value')
    case 1 %trapezoidal
        [out, x] = trap(a, b, fs, h);
        for i = 1:size(x, 2)-1
            fill([x(i) x(i) x(i+1) x(i+1)], [0 f(x(i)) f(x(i+1)) 0], 'r');
            pause(0.1);
        end
        lat = sprintf('$$%s$$', out);
        xlim = get(handles.axes1, 'XLim');
        ylim = get(handles.axes1, 'YLim');
        text('Interpreter', 'latex', 'string', lat, 'FontSize', 16, 'Position', [xlim(1)+1/10*(xlim(2)-xlim(1)) ylim(1)+(2/3*(ylim(2)-ylim(1)))]);
    case 2 %simpson1/3
        [out, x] = simpson1(a, b, fs, h);
        for i = 1:size(x, 2)-1
            fill([x(i) x(i) x(i+1) x(i+1)], [0 f(x(i)) f(x(i+1)) 0], 'r');
            pause(0.1);
        end
        lat = sprintf('$$%s$$', out);
        xlim = get(handles.axes1, 'XLim');
        ylim = get(handles.axes1, 'YLim');
        text('Interpreter', 'latex', 'string', lat, 'FontSize', 16, 'Position', [xlim(1)+1/10*(xlim(2)-xlim(1)) ylim(1)+(2/3*(ylim(2)-ylim(1)))]);
    case 3 %simpson3/8
        [out, x] = simpson3(a, b, fs, h);
        for i = 1:size(x, 2)-1
            fill([x(i) x(i) x(i+1) x(i+1)], [0 f(x(i)) f(x(i+1)) 0], 'r');
            pause(0.1);
        end
        lat = sprintf('$$%s$$', out);
        xlim = get(handles.axes1, 'XLim');
        ylim = get(handles.axes1, 'YLim');
        text('Interpreter', 'latex', 'string', lat, 'FontSize', 16, 'Position', [xlim(1)+1/10*(xlim(2)-xlim(1)) ylim(1)+(2/3*(ylim(2)-ylim(1)))]);
    case 4 %Romberg
        out = romberg(a, b, fs, h);
        set(handles.uitable1, 'Data', out);
    case 5 %gauss-legendre
        out = guleg(a, b, fs, h);
        lat = sprintf('$$%s$$', out);
        lat2 = strcat('$$x_i:\;', num2str(x(1)));
        lat3 = strcat('$$w_i:\;', num2str(w(1)));
        for i = 2:size(x,1)
            lat2 = strcat(lat2, ', ', num2str(x(i)));
            lat3 = strcat(lat3, ', ', num2str(w(i)));
        end
        lat2 = strcat(lat2, '$$');
        lat3 = strcat(lat3, '$$');
        lat4 = strcat('$$', num2str(p(1)));
        for i = 2:size(p,2)
            if p(i) ~= 0
                lat4 = strcat(lat4, '+', num2str(p(i)), 'x^', num2str(i-1));
            end
        end
        lat4 = strcat(lat4,'$$');
        xlim = get(handles.axes1, 'XLim');
        ylim = get(handles.axes1, 'YLim');
        text('Interpreter', 'latex', 'string', lat, 'FontSize', 16, 'Position', [xlim(1)+1/10*(xlim(2)-xlim(1)) ylim(1)+(2/3*(ylim(2)-ylim(1)))]);
        text('Interpreter', 'latex', 'string', lat2, 'FontSize', 16, 'Position', [xlim(1)+1/10*(xlim(2)-xlim(1)) ylim(1)+(1/2*(ylim(2)-ylim(1)))]);
        text('Interpreter', 'latex', 'string', lat3, 'FontSize', 16, 'Position', [xlim(1)+1/10*(xlim(2)-xlim(1)) ylim(1)+(1/3*(ylim(2)-ylim(1)))]);
        text('Interpreter', 'latex', 'string', lat4, 'FontSize', 16, 'Position', [xlim(1)+1/10*(xlim(2)-xlim(1)) ylim(1)+(1/6*(ylim(2)-ylim(1)))]);
    case 6
        a = str2double(get(handles.edit11, 'string'));
        b = str2double(get(handles.edit12, 'string'));
        c = str2double(get(handles.edit13, 'string'));
        d = str2double(get(handles.edit14, 'string'));
        out = integ2D(a, b, c, d, f, h);
end

hold off;

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = get(handles.edit6, 'string');
% f = inline(fs);
x = str2double(get(handles.edit5, 'string'));
h = str2double(get(handles.edit7, 'string'));
o = str2double(get(handles.edit8, 'string'));
e = str2double(get(handles.edit9, 'string'));
cla;
hold on;
% 
% X = linspace(a,b,1000);
% Y = f(X);
% plot(X, Y);

out = RichardsonExtrapolation(f, x, get(handles.popupmenu2, 'value'), h, o, e);

lat = sprintf('$$%s$$', out);
xlim = get(handles.axes1, 'XLim');
ylim = get(handles.axes1, 'YLim');
text('Interpreter', 'latex', 'string', lat, 'FontSize', 16, 'Position', [xlim(1)+1/10*(xlim(2)-xlim(1)) ylim(1)+(2/3*(ylim(2)-ylim(1)))]);



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
