function [] = f_wbfcn(varargin) 

%global f f1

% Windowbuttondownfcn for figure. Recreates the plot which was clicked. 
ch = get(gca,'children');
figure
copyobj(ch,axes);
pause(5)
end