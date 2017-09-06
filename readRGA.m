function [x,y] = readRGA(filename)
%reads an RGA trace file in xml format
fid = fopen(filename);

%reads in all pieces
H = textscan(fid,'%s','headerlines',2);
fclose(fid);

%only even entries are relvant


for ind = 2 : 2 : length(H{1})
    tmp = H{1}{ind};
    y(ind/2) = str2num(tmp(8:end-3));          %insulate data entry
end;

%now do xaxis
fid = fopen(filename);
H = textscan(fid,'%s','headerlines',1);
fclose(fid);
low = H{1}{2};
high = H{1}{3};

x1 = str2num(low(10:end-1));
x2 = str2num(high(11:end-1));
x = x1 : (x2-x1)/(length(y)-1) : x2;

