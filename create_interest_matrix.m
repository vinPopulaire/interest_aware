function E_i = create_interest_matrix(distances, params)

if strcmp(params.case_type,'random_case')

    % random values on matrix
    a = rand(params.m,params.m);

    % make matrix symmetric with 0 on the diagonal
    E_i = triu(a,1) + triu(a,1)';
    
elseif strcmp(params.case_type,'best_case')
    % Devices that are close (small distance) have high interest
    max_dist = max(max(distances(1:params.m,1:params.m)));
    E_d = distances(1:params.m,1:params.m)/max_dist;
    
    E_i = 1-E_d;
    
elseif strcmp(params.case_type,'worst_case')
    % Devices that are close (small distance) have low interest
    max_dist = max(max(distances(1:params.m,1:params.m)));
    E_d = distances(1:params.m,1:params.m)/max_dist;
    
    E_i = E_d;
    
else
    error('Unknown case for interest matrix creation');
end

end