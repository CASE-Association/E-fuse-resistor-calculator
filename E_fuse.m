%% CASE E-fuse calcuation
% E-fuse resistor calculator
% Select some value for R1 
R1 = 10^5; % ohm
V_ovp = 15; 
V_uvp = 7;
u_r_ovp = 0.99; % voltage over ovp resistor
u_r_uvp = 0.92; % voltage over uvp resistor

syms R2 R3

eq = [R3==(R1+R2+R3)/V_ovp;
      R2==(R1+R2+R3)/V_uvp];

sol = solve(eq);

clc
R = [R1;
    double(sol.R2);
    double(sol.R3)];


disp('<strong>Calcuated resistor values:</strong>')
for i = 1 : 3
   disp(['R' num2str(i) ' = ' num2str(R(i)) ' ohm']) 
end

% Over voltage
disp('------------------------------')
ovp = V_ovp * R(3)/sum(R);
uvp = V_ovp * R(2)/sum(R);
disp('Voltage at Overvoltage level: ')
disp(['ovp: ' num2str(ovp)]);
disp(['uvp: ' num2str(uvp) ]);

% Under voltage
disp('------------------------------')
ovp = V_uvp * R(3)/sum(R);
uvp = V_uvp * R(2)/sum(R);
disp('Voltage at Undervoltage level: ')
disp(['ovp: ' num2str(ovp)]);
disp(['uvp: ' num2str(uvp) ]);

%% Protection values for selected values
% Input selcted resistor value to get over and under voltage protection
% level.
clc
R1 = R1;
R2 = 18*10^3;
R3 = 8.2*10^3;

V_ovp = u_r_ovp/(R3/(R1+R2+R3));
V_uvp = u_r_uvp/ (R2/(R1+R2+R3));

disp('<strong>Achieved voltage levels:</strong>')
disp(['Overvoltage protection: '...
    num2str(V_ovp) ' v'])
disp(['Undervoltage protection: '... 
    num2str(V_uvp) ' v'])





