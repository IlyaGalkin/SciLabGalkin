// Copyright (C) 2017 - Corporation - Author
//
// Made by Galkin Ilya
//
// Date of creation: 03.12.2017
//
//part1
a=input("Введите а")
fi=[-%pi/4:0.01:%pi/4] 
ro=sqrt(2*a^2*cos(2*fi))
ro=[ro,-ro]
fi=[fi,fi]
scf(1) 
clf(1)  
plot(fi,ro)
//part2
function [ro,ki]=а(x,y)//из декарт в поляр
    if (x==0)&(y>0) then
        ki=%pi/2;
        ro=abs(y);
    elseif (x==0)&(y<0) then
        ki=3/2*%pi;
        ro=abs(y);
    else
        ki=atan(y/x);
        ro=sqrt(x^2+y^2);
        format(5);
    end
    disp(ki,'fi= ');
    disp(ro,'ro= ');
endfunction
function [x,y]=f0(ki,ro)//из поляр в прямоуг декарт
        x=ro*cos(fi);
        y=ro*sin(fi);
        format(5);
        disp(x,'x= ');
        disp(y,'y= ');
    end
endfunction
function [ro,ki,z]=f1(x,y,z)//из пдск в цилиндр
    if (x==0)&(y>0) then
        ki=%pi/2;
        ro=abs(y);
    elseif (x==0)&(y<0) then
        ki=3/2*%pi;
        ro=abs(y);
    else
        ki=atan(y/x);
        ro=sqrt(x^2+y^2);
        format(5);
    end
    disp(ki,'fi= ');
    disp(ro,'ro= ');
    disp(z,'z= ');
endfunction
function [x,y,z]=f2(ki,ro,z)//из цилиндр в пдск
        x=ro*cos(ki);
        y=ro*sin(ki);
        z=z;
        disp(x,'x=');
        disp(y,'y=');
        disp(z,'z=');
    end
endfunction
function [ki,teta,ro]=f3(x,y,z)//из пдск в в сферич
    if x==y==z==0 then
        disp('не можливо здійснити перехід');
    elseif (x==0)&&(y>0) then
        ki=%pi/2;
        ro=sqrt(x^2+y^2+z^2);
        teta=acos(z/ro);
    elseif (x==0)&&(y<0) then
        ki=3/2*%pi;
        ro=sqrt(x^2+y^2+z^2);
        teta=acos(z/ro);
    else
        ki=atan(y/x);
        ro=sqrt(x^2+y^2+z^2);
        teta=acos(z/ro);
    end
    format(7);
    disp(ki,'fi= ');
    disp(ro,'ro= ');
    disp(teta,'teta= ');
endfunction
function [x,y,z]=f4(ki,te,ro)//из сфер. в пдск
    if ro<=0 then
        disp('Error:ro<=0');
    else
        x=ro*sin(te)*cos(ki);
        y=ro*sin(te)*sin(ki);
        z=ro*cos(te);
        disp(x,'x=');
        disp(y,'y=');
        disp(z,'z=');
    end
endfunction
//part3
function a=g(A1,B1,C1,A2,B2,C2)
    x=[-10:00.1:10];
    y1=(-A1/B1)*x+(-C1/B1);
    y2=(-A2/B2)*x+(-C2/B2);
    plot(x,y1);//grafics
    plot(x,y2,'r');
    if A1/A2==B1/B2 then//y1||y2
        angl=0;
        disp('y1||y2')
        disp(angl,'angl=');
    else
        x0=((-C2/B2)-(-C1/B1))/((-A1/B1)-(-A2/B2));//т. пересечения
        y0=(-A1/B1)*x0+(-C1/B1);
        plot(x0,y0,'.b')
        angl=acos((A1*A2+B1*B2)/sqrt((A1^2+B1^2)*(A2^2+B2^2)))//угол 
        disp(angl,'angl=');
    end
    a=''
endfunction
//part4
function d=len(x0,y0,A,B,C)//расстояние от точки до прямой
    d=abs(A*x0+B*y0+C)/sqrt(A^2+B^2);
    disp(d,'расстояние: ');
endfunction
//part5
x1=[0,0,0];
y1=[1,5,6];
z1=[5,3,10];
x2=[5,6,9];
y2=[6,6,6];
z2=[2,3,8];
plot3d(x1,y1,z1,1);//две плоскости
plot3d(x2,y2,z2,2);
