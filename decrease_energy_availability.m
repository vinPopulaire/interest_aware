function E = decrease_energy_availability(old_E, clusterheads, power, transmission_type, params)
% USAGE
%  E = update_energy_availability(old_E, clusterheads, power)
%
% INPUTS
%  old_E        - [m x 1] previous energy availability for every device
%  clusterheads - [1 x c] ids of clusterheads
%  power        - [1 x c] power spent
%
% OUTPUTS
%  E        - [m x 1] Updated energy availability for every device

E = old_E;

if strcmp(transmission_type,'info')
    
    time = params.timeslot*(1-params.alpha);
    
    for ii = 1:numel(clusterheads)
        E(clusterheads(ii)) = E(clusterheads(ii)) - power(clusterheads(ii))*time;
    end
      
elseif strcmp(transmission_type,'energy')
    
    time = params.timeslot*params.alpha;
    
    for ii = 1:numel(clusterheads)
        E(clusterheads(ii)) = E(clusterheads(ii)) - power(ii)*time;
    end
    
else
    error('wrong transmission type');
end

end