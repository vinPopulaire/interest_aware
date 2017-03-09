function E = create_energy_availability(params)
% USAGE
%  E = create_energy_availability(m)
%
% INPUTS
%  m          - number of devices
%
% OUTPUTS
%  E        - [m x 1] Energy availability for every device

E = 0.001*ones(params.m,1);

end

