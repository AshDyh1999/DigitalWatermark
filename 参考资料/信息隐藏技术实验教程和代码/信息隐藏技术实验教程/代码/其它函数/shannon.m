%shannon母小波绘制函数

function shannon
t=-11:0.1:11;
len=length(t);
for i=1:len
    if t(i)~=0
      y(i)=cos(3*pi*t(i)/2)*sin(pi*t(i)/2)/(pi*t(i)/2);
  else
      y(i)=1;
  end
end
t2=(t-1)/0.5;
t3=(t-1)/2;
for i=1:len
    if t2(i)~=0
      y2(i)=cos(3*pi*t2(i)/2)*sin(pi*t2(i)/2)/(pi*t2(i)/2);
  else
      y2(i)=1;
  end
end
for i=1:len
    if t3(i)~=0
      y3(i)=cos(3*pi*t3(i)/2)*sin(pi*t3(i)/2)/(pi*t3(i)/2);
  else
      y3(i)=1;
  end
end
y2=y2/sqrt(0.5);
y3=y3/sqrt(2);
subplot(311);plot(t,y);xlabel('t');axis([-15,15,-1,1]);ylabel('Shannon函数');title('母小波函数');
subplot(312);plot(t,y2);xlabel('t');axis([-15,15,-1.5,1.5]);ylabel('0.5^{-1/2}φ((t-1)/0.5)');title('a=0.5,b=1的伸缩平移效果');
subplot(313);plot(t,y3);xlabel('t');axis([-15,15,-1,1]);ylabel('2^{-1/2}φ((t-1)/2)');title('a=2,b=1的伸缩平移效果');
