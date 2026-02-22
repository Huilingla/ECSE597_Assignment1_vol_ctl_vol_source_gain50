% 1. Run the netlist to build G, C, b
filter_netlist; 

% 2. Solve for frequency response from 1Hz to 2000Hz with 500 points 
[f, vout_mag] = fsolve(1, 2000, 500, 10); 

% 3. Plot on loglog scale 
figure;
loglog(f, vout_mag, 'LineWidth', 1.5);
grid on;
title('Frequency Response of OpAmp Filter');
xlabel('Frequency (Hz)');
ylabel('|V_{out}|');