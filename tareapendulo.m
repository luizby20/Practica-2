[tiempo, resultado] = ode45(@modelo_pendulo, [0 10], [0 0 1 0]);

figure;
plot(tiempo, resultado(:, 3), 'b', 'LineWidth', 1.5);
xlabel('Tiempo [s]');
title('alfa');
grid on;

figure;
plot(tiempo, resultado(:, 1), 'r', 'LineWidth', 1.5);
xlabel('Tiempo [s]');
title('xc');
grid on;
