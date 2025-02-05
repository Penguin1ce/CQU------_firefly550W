clc;clear;
% 定义常量
G = 1;        % 引力常数
m1 = 1;     
m2 = 1;
m3 = 1;

% 定义微分方程组
odefun = @(t, Y) [
    Y(3); % x1' = vx1
    Y(4); % y1' = vy1
    Y(7); % x2' = vx2
    Y(8); % y2' = vy2
    Y(11); % x3' = vx3
    Y(12); % y3' = vy3
    -G * m2 * (Y(1) - Y(5)) / ((Y(1) - Y(5))^2 + (Y(2) - Y(6))^2)^1.5 - G * m3 * (Y(1) - Y(9)) / ((Y(1) - Y(9))^2 + (Y(2) - Y(10))^2)^1.5; % vx1'
    -G * m2 * (Y(2) - Y(6)) / ((Y(1) - Y(5))^2 + (Y(2) - Y(6))^2)^1.5 - G * m3 * (Y(2) - Y(10)) / ((Y(1) - Y(9))^2 + (Y(2) - Y(10))^2)^1.5; % vy1'
    -G * m1 * (Y(1) - Y(5)) / ((Y(1) - Y(5))^2 + (Y(2) - Y(6))^2)^1.5 - G * m3 * (Y(5) - Y(9)) / ((Y(5) - Y(9))^2 + (Y(6) - Y(10))^2)^1.5;  % vx2'
    -G * m1 * (Y(2) - Y(6)) / ((Y(1) - Y(5))^2 + (Y(2) - Y(6))^2)^1.5 - G * m3 * (Y(6) - Y(10)) / ((Y(5) - Y(9))^2 + (Y(6) - Y(10))^2)^1.5; % vy2'
    -G * m1 * (Y(1) - Y(9)) / ((Y(1) - Y(9))^2 + (Y(2) - Y(10))^2)^1.5 - G * m2 * (Y(5) - Y(9)) / ((Y(5) - Y(9))^2 + (Y(6) - Y(10))^2)^1.5; % vx3'
    -G * m1 * (Y(2) - Y(10)) / ((Y(1) - Y(9))^2 + (Y(2) - Y(10))^2)^1.5 - G * m2 * (Y(6) - Y(10)) / ((Y(5) - Y(9))^2 + (Y(6) - Y(10))^2)^1.5; % vy3'
];

x31 = 2*0.466;
k = 5;
x31 = x31/(10-k);% k = 9为初始状态
% 时间区间
tspan = [0 2.1];
y0 = [-0.970;0.243;0.970;-0.243;0;0;-0.466;-0.433;-0.466;-0.433;x31;2*0.433];

% 使用 ode45 求解
[t, Y] = ode45(odefun, tspan, y0);

% 绘制物体1、2、3的轨迹
plot(Y(:,1), Y(:,2), 'b', 'LineWidth', 2);  % 物体1轨迹
hold on;
plot(Y(:,5), Y(:,6), 'r', 'LineWidth', 2);  % 物体2轨迹
plot(Y(:,9), Y(:,10), 'g', 'LineWidth', 2); % 物体3轨迹
xlabel('x');
ylabel('y');
legend('m1', 'm2', 'm3','Location','southeast');
grid on;
axis equal;
hold off