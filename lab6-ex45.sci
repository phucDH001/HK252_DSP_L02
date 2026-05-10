omega = [-%pi, -3*%pi/4, -%pi/2, -%pi/4, 0, %pi/4, %pi/2, 3*%pi/4, %pi];
P = [0, 0.0625, 0.25, 1, 4, 1, 0.25, 0.0625, 0];

plot2d3(omega, P);
plot(omega, P, 'ro');
title("PDS");
xlabel("Omega (rad/sample)");
ylabel("Power");
