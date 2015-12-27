function X_scaledownbutton_Callback(source,eventdata)

global X

X=X-10;

if X<=10
    msgbox('Capat de scala!','Warning!')
end

end