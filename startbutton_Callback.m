function startbutton_Callback(source,eventdata)
global s XPOS xX yX xY yY xZ yZ X

fopen(s);

%fX = figure('Visible','on','Position',[600,500,700,400]);
%fY = figure('Visible','on','Position',[300,500,700,400]);
%fZ = figure('Visible','on','Position',[4,500,700,400]);

Xhzoomin = uicontrol('Style','pushbutton','String','||',...
           'Tool', 'zoom in',...
           'Position',[50,600,25,50],...
           'Callback',{@X_zoominbutton_Callback});
Xhzoomout = uicontrol('Style','pushbutton','String','|||',...
           'Tool', 'zoom out',...
           'Position',[50,540,25,50],...
           'Callback',{@X_zoomoutbutton_Callback});
Xhscaleup = uicontrol('Style','pushbutton','String','+',...
           'Tool', 'scale up',...
           'Position',[1300,600,25,50],...
           'Callback',{@X_scaleupbutton_Callback});
Xhscaledown = uicontrol('Style','pushbutton','String','-',...
           'Tool', 'scale down',...
           'Position',[1300,540,25,50],...
           'Callback',{@X_scaledownbutton_Callback});
%align([hzoomin, hzoomout, hscaleup, hscaledown],'Center','None');

reznX=[];
reznY=[];
reznZ=[];
position=1;
time_x=1;
time_y=1;
time_z=1;

XPOS=30;

%g=0.018;
X=120;

xX=(1:XPOS)';
%xlabelsX = (1:XPOS);
yX= zeros(XPOS,1);

xY=(1:XPOS)';
%xlabelsY = (1:XPOS);
yY= zeros(XPOS,1);

xZ=(1:XPOS)';
%xlabelsZ = (1:XPOS);
yZ= zeros(XPOS,1);

%fid = fopen('out.txt', 'w');
%x=1:1:20000;

%set(f,'WindowButtonDownFcn',{@f_wbfcn});
while(1)
        %for X
        fwrite(s,'X>')
        dataX = fscanf(s)
        reznX = str2double(dataX);
        yX(position,:)=reznX';
        %xlabelsX(position)=time_x;
        time_x=time_x+1;
        
        %for Y
        fwrite(s,'Y>')
        dataY = fscanf(s)
        reznY = str2double(dataY);
        yY(position,:)=reznY';
        %xlabelsY(position)=time_y;
        time_y=time_y+1;
        
        %for Z
        fwrite(s,'Z>')
        dataZ = fscanf(s)
        reznZ = str2double(dataZ);
        yZ(position,:)=reznZ';
        %xlabelsZ(position)=time_z;
        time_z=time_z+1;
        
        
        if (position < XPOS)
            position = position + 1;
        else
            position = 1;
            yX= zeros(XPOS,1);
            yY= zeros(XPOS,1);
            yZ= zeros(XPOS,1);
        end
        
        subplot(3,1,1);
        plot(xX,yX,'r');
        title('X Axis','FontWeight','bold', 'Color', 'white');
        axis([0,XPOS,-X,X]);
        %set(gca, 'XTickLabel', xlabelsX);
        grid minor
        set(gca,'Xcolor',[.8 .8 .8])
        set(gca,'Ycolor',[.8 .8 .8])
        drawnow
        
        subplot(3,1,2);
        plot(xY,yY,'g');
        title('Y Axis','FontWeight','bold', 'Color', 'white');
        axis([0,XPOS,-X,X]);
        %set(gca, 'XTickLabel', xlabelsY);
        grid minor
        set(gca,'Xcolor',[.8 .8 .8])
        set(gca,'Ycolor',[.8 .8 .8])
        drawnow
        
        subplot(3,1,3);
        plot(xZ,yZ,'b');
        title('Z Axis','FontWeight','bold', 'Color', 'white');
        axis([0,XPOS,-X,X]);
        %set(gca, 'XTickLabel', xlabelsZ);
        grid minor
        set(gca,'Xcolor',[.8 .8 .8])
        set(gca,'Ycolor',[.8 .8 .8])
        drawnow
        
        pause(0.01);
        %fprintf(fid,'%d\n',rezn);
end

end  