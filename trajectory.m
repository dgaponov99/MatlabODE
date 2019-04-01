t0 = 0; tf = 3*10^9;
x0 = [1.496*10^11 0 0 3.978278*10^4]'; %Начальные условия
options=odeset('RelTol',0.000001);
[t, X] = ode45(@vdpol, t0:3600:tf, x0, options);

Mx = max(X(:,1));
My = max(X(:,2));
mx = min(X(:,1));
my = min(X(:,2));

%curve = animatedline;
set(gca, 'XLim', [1.05*mx 1.05*Mx], 'YLim', [1.05*my 1.05*My]);
grid on;
hold on;
axis('equal');
plot(0,0,'ro','MarkerSize', 14, 'MarkerFaceColor', [1 0 0]);
ph1 = plot(X(1,1), X(1,2), 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
plot(X(:,1), X(:,2), '-');
p = 1000;
for i = 1:length(t)/p
    disp(i*p + ' ' + sqrt(X(i*p,3)^2 + X(i*p,4)^2));
    set(ph1, 'XData', X(i*p,1), 'YData', X(i*p,2));
    %addpoints(curve, X(i*p,1), X(i*p,2));
    %drawnow limitrate
    pause(0)
    %if i > 100 & abs(X(i,1) - X(1,1) < 10^4)% & (abs(X(i,3) - X(1,3)) < 10^4)
    %   break
    %end
end

%comet(X(:, 1), X(:, 3))%, grid, hold on
%gtext('x1'), gtext('x2')