function opa(inplus, inminus, out)
% opa(inplus, inminus, out) 
% Adds the stamp of an ideal op-amp (infinite gain) 
global G C b

% xr is the index for the new row/column representing 
% the output current of the op-amp
xr = size(G,1) + 1; 

% Initialize new entries 
G(xr,xr) = 0; 
C(xr,xr) = 0; 
b(xr) = 0;

% Voltage Constraint: V(inplus) - V(inminus) = 0
if (inplus ~= 0)
    G(xr, inplus) = 1;
end
if (inminus ~= 0)
    G(xr, inminus) = -1;
end

% Current Constraint: The op-amp output node (out) receives 
% the current from the added MNA variable (xr)
if (out ~= 0)
    G(out, xr) = 1;
end