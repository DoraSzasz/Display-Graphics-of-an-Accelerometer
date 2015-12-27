function X_zoominbutton_Callback(source,eventdata)

global XPOS xX yX xlabelsX xY xlabelsY yY xZ xlabelsZ yZ

step=10;
XPOS=XPOS - step;
xX=(1:XPOS)';
xlabelsX = (1:XPOS);
yX= zeros(XPOS,1);

xY=(1:XPOS)';
xlabelsY = (1:XPOS);
yY= zeros(XPOS,1);

xZ=(1:XPOS)';
xlabelsZ = (1:XPOS);
yZ= zeros(XPOS,1);

if XPOS<=10
    msgbox('Capat de scala!','Warning!')
end

end