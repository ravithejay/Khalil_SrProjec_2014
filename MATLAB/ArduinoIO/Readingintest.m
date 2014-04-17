clc; close all; clear all;
global a;

Startup;
a = arduino('COM4');
ai_pin = 0;
ai_pin2 = 1;
tic;
i = 0;

port1disease = 0;
port2disease = 0;
count1 = 0;
count2 = 0;


while toc <30
    i = i +1;
    time(i) = toc;
    v(i) = a.analogRead(ai_pin);
    v2(i) = a.analogRead(ai_pin2);
    figure(1);
    plot(time,v,'r');
    hold on
    plot(time,v2);
    
    if v(i) < (.8 * v(1))
        port1disease = 1;
    end
    
    
     if v2(i) < (.1 * v2(1))
        port2disease = 1;
    end
    
    
    
    ylim([0 1100])
    pause(.25);
end

if port1disease == 1 && count1 == 0
sendmail('ravithejay@yahoo.com','Mail from Diagnostics','You are positive for X disease')
count1 = count1+1;
end

if port2disease == 1 && count2 == 0
    sendmail('ravithejay@yahoo.com','Mail from Diagnostics','You are positive for X disease')
    count2 = count2+1;
end


if port1disease == 0 && count1 == 0
sendmail('ravithejay@yahoo.com','Mail from Diagnostics','You are negative for X disease')
end

if port2disease == 0 && count2 == 0
    sendmail('ravithejay@yahoo.com','Mail from Diagnostics','You are negative for X disease')
end
