
 
%% And finally put down anything ye have brought forth
clear all;

setpref('Internet', 'E_mail', 'vraviy@gmail.com');
setpref('Internet', 'SMTP_Username', 'vraviy@gmail.com');
setpref('Internet', 'SMTP_Password', 'W3S7w00d92');
setpref('Internet', 'SMTP_Server', 'smtp.gmail.com');
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port', '465');