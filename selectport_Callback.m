function selectport_Callback(source,eventdata)

global current_data s

str = get(source, 'String');
%val = get(source,'Value');
switch str;
      case 'COM1' 
         current_data = 'COM1';
      case 'COM2' 
         current_data = 'COM2';
      case 'COM3' 
         current_data = 'COM3';
      case 'COM4' 
         current_data = 'COM4';
      case 'COM5'  
         current_data = 'COM5';
      case 'COM6' 
         current_data = 'COM6';
      case 'COM7' 
         current_data = 'COM7';
      case 'COM8' 
         current_data = 'COM8';
      case 'COM9'
         current_data = 'COM9';
      case 'COM10' 
         current_data = 'COM10';
end

end