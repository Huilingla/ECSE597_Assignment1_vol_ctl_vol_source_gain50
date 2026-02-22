% Netlist for Fig. 2 OpAmp filter circuit 
global G C b;

% Initialize matrices for 10 nodes (excluding additional MNA variables) 
G = zeros(10, 10); 
C = zeros(10, 10);
b = zeros(10, 1);

% Component Values from Fig. 2 
R1a = 9606; R1b = 23280; R2 = 6800; Rg = 9304; 
Rq = 52107; R3 = 9304; R4 = 9304; r_val = 20000;
C1 = 94.9e-9; C2 = 20.5e-9; C3 = 15e-9; C4 = 15e-9;

% Stamps
vol(1, 0, 1);           % Input voltage vi 
res(1, 2, R1a);         % R1a
res(2, 0, R1b);         % R1b
res(2, 3, R2);          % R2
cap(3, 0, C2);          % C2
cap(2, 4, C1);          % C1 (feedback)

% OpAmp 1 (Voltage Controlled Voltage Source, Gain=50) 
% vcvs(output+, output-, input+, input-, gain) 
vcvs(4, 0, 3, 4, 50);   

res(4, 5, Rg);          % Rg
res(5, 6, Rq);          % Rq
cap(5, 6, C3);          % C3
res(10, 5, R3);         % R3 (feedback from vout)

% OpAmp 2 (Gain=50)
vcvs(6, 0, 0, 5, 50);   

res(6, 7, R4);          % R4
cap(7, 8, C4);          % C4
% OpAmp 3 (Gain=50)
vcvs(8, 0, 0, 7, 50);   

res(8, 9, r_val);       % r
res(9, 10, r_val);      % r (feedback)
% OpAmp 4 (Gain=50)
vcvs(10, 0, 0, 9, 50);