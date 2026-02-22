function vol(n1, n2, val)
% Add stamp for voltage source to the global circuit representation
global G C b

d = size(G, 1); 
xr = d + 1; % New row index

% Initialize new entries
b(xr) = val;
G(xr, xr) = 0;
C(xr, xr) = 0;

if (n1 ~= 0)
    G(n1, xr) = 1;
    G(xr, n1) = 1;
end

if (n2 ~= 0)
    G(n2, xr) = -1;
    G(xr, n2) = -1;
end