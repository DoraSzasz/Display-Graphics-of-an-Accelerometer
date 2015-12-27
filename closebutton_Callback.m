function closebutton_Callback(source,eventdata)

global s

fclose(s);
%delete(s);
%clear s;
end