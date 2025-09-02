function salida = modelo_pendulo(tiempo, estado)
    % Parámetros físicos
    inercia_p = 0.0079;
    masa_carro = 0.7031;
    largo_pend = 0.3302;
    masa_pend = 0.23;
    fuerza_c = 0; 
    fric_lineal = 4.3; 
    gravedad = 9.81;
    fric_pivote = 0.0024;
    
    % Variables de estado
    pos_carro = estado(1);
    vel_carro = estado(2);
    angulo = estado(3);
    vel_angulo = estado(4);

    % Cálculo del denominador común
    denominador = (masa_carro + masa_pend)*inercia_p + masa_carro*masa_pend*largo_pend^2 + masa_pend^2*largo_pend^2*sin(angulo)^2;

    % Ecuaciones del sistema
    aceleracion_carro = ((inercia_p + masa_pend*largo_pend^2)*fuerza_c + ...
                         masa_pend^2*largo_pend^2*gravedad*cos(angulo)*sin(angulo) - ...
                         (inercia_p + masa_pend*largo_pend^2)*fric_lineal*vel_carro - ...
                         (inercia_p*masa_pend*largo_pend - masa_pend^2*largo_pend^3)*vel_angulo^2*sin(angulo) - ...
                         masa_pend*largo_pend*vel_angulo*cos(angulo)*fric_pivote) / denominador;

    aceleracion_angulo = ((masa_carro + masa_pend)*masa_pend*gravedad*largo_pend*sin(angulo) - ...
                          (masa_carro + masa_pend)*fric_pivote*vel_angulo + ...
                          fuerza_c*masa_pend*largo_pend*cos(angulo) - ...
                          masa_pend^2*largo_pend^2*vel_angulo^2*sin(angulo)*cos(angulo) - ...
                          fric_lineal*masa_pend*largo_pend*vel_carro*cos(angulo)) / denominador;

    % Vector de salida
    salida = zeros(4, 1);
    salida(1) = vel_carro;
    salida(2) = aceleracion_carro;
    salida(3) = vel_angulo;
    salida(4) = aceleracion_angulo; 
end






  
  