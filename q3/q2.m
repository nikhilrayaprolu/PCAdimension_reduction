filename='car.wav';
duration=6;
for t=0:3
        w=(102*400)/97;
        fs=8000;  % sampling frequency
values=0:1/fs:t+1;
amplitude=1;
y=amplitude*cos(2*pi* w*values);
end
for t=3:5
        w=(102*400)/107;
    
fs=8000;  % sampling frequency
values=0:1/fs:t+1;
amplitude=1;
y=amplitude*cos(2*pi* w*values);
end
for i=1:48000
    position=i;
    d=abs(50-((50/3)*(position/8000)));
    if d==0
        y(position)=y(position);
    else
        y(position)=y(position)/d;
    end
end
doppleraudio=y;

audiowrite(filename,doppleraudio,8000);
