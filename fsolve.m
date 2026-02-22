function [fpoints, r] = fsolve(fL, fH, N, out)
% fsolve(fL, fH, N, out) - Obtain frequency domain response 
% global variables G, C, and b must be created by the netlist 
global G C b

% Generate N linearly spaced frequency points 
fpoints = linspace(fL, fH, N);
r = zeros(1, N);

for k = 1:N
    f = fpoints(k);
    w = 2 * pi * f; % Calculate angular frequency
    
    % Solve (G + jwC)x = b using MATLAB's efficient backslash operator 
    % This is equivalent to x = inv(G + 1i*w*C) * b 
    x = (G + 1i * w * C) \ b;
    
    % Store the magnitude of the response at the specified output node 
    r(k) = abs(x(out));
end