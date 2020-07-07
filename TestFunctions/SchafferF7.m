function [yy]=SchafferF7(xx)
%Function Schaffer F7

x0=xx(1:end-1);
x1=xx(2:end);
yy = sum(((x0.^2+x1.^2).^(0.25)).*((sin(50*(x0.^2+x1.^2).^(0.10)).^2)+1.0));
