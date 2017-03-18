function powers = find_powers_to_send_info(powers_requested,clusterheads, E, params)
% USAGE
%  power = find_powers_clusterheads_must_transmit(powers_requested,clusters,clusterheads)
%
% INPUTS
%  powers_requested - [1 x y] array with powers needed for transmission
%  clusterheads     - [1 x c] ids of the clusterhead
%  G                - [y x y] matrix with Channel Gains of pairs
%  E                - [1 x y] energy of devices
%  alpha            - t1 = a*t, t2 = (1-a)t
%  n                - energy conversion efficiency factor
%
% OUTPUTS
%  powers           - [1 x y] array with powers it will transmit info

num_clusterheads = size(clusterheads,2);
num_devices = size(powers_requested,2);

powers = zeros(1,num_devices);
time = params.timeslot*(1-params.alpha);

for kk = 1:num_clusterheads
    available_power = E(clusterheads(kk))/time;
    if available_power < powers_requested(clusterheads(kk))
        powers(clusterheads(kk)) = available_power;
    else
        powers(clusterheads(kk)) = powers_requested(clusterheads(kk));
    end
end

end