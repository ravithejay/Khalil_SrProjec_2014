%instrhwinfo('Bluetooth')
%ans.RemoteNames
%instrhwinfo('Bluetooth','HC-06')

bt = Bluetooth('HC-06',1);
fopen(bt)
fprintf(bt,'<')
val = fscanf(bt);