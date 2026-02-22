function vccs(nd1, nd2, ni1, ni2, val)
    global G
    if (nd1 ~= 0 && ni1 ~= 0), G(nd1,ni1) = G(nd1,ni1) + val; end
    if (nd1 ~= 0 && ni2 ~= 0), G(nd1,ni2) = G(nd1,ni2) - val; end
    if (nd2 ~= 0 && ni1 ~= 0), G(nd2,ni1) = G(nd2,ni1) - val; end
    if (nd2 ~= 0 && ni2 ~= 0), G(nd2,ni2) = G(nd2,ni2) + val; end
end