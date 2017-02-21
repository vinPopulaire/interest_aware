function E = update_energy_availability(old_E, clusterheads, power, t, alpha)
% USAGE
%  E = update_energy_availability(old_E, clusterheads, power)
%
% INPUTS
%  old_E        - [m x 1] previous energy availability for every device
%  clusterheads - [1 x c] ids of clusterheads
%  power        - [1 x c] power clusterheads must transmit
%
% OUTPUTS
%  E        - [m x 1] Updated energy availability for every device

E = old_E;
time = t*alpha;

for ii = 1:numel(clusterheads)
    E(clusterheads(ii)) = E(clusterheads(ii)) - power(ii)*time;
end

end