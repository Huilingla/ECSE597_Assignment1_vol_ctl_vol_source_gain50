function vcvs(nd1, nd2, ni1, ni2, val)
    global G C b
    xr = size(G,1) + 1; 
    G(xr,xr) = 0; C(xr,xr) = 0; b(xr) = 0;
    if (nd1 ~= 0), G(nd1,xr) = 1; G(xr,nd1) = 1; end
    if (nd2 ~= 0), G(nd2,xr) = -1; G(xr,nd2) = -1; end
    if (ni1 ~= 0), G(xr,ni1) = G(xr,ni1) - val; end
    if (ni2 ~= 0), G(xr,ni2) = G(xr,ni2) + val; end
end