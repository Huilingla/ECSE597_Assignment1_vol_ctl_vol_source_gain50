function ind(n1, n2, val)
    global G C b
    xr = size(G,1) + 1; % New variable for inductor current
    G(xr,xr) = 0; C(xr,xr) = val; b(xr) = 0; 
    if (n1 ~= 0), G(n1,xr) = 1; G(xr,n1) = 1; end
    if (n2 ~= 0), G(n2,xr) = -1; G(xr,n2) = -1; end
end