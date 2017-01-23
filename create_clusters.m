function clusters = create_clusters(ID, D, a, w_1, w_2)

% USAGE
%  clusters = create_clusters( ID, D, a, w_1, w_2 )
%
% INPUTS
%  ID         - [m x m] Interest Distance matrix
%  D          - [m x m] Physical Distance matrix
%  a          - probability for device to form own cluster
%  w_1        - weight for ID in cluster creation
%  w_2        - weight for D in cluster creation
%
% OUTPUTS
%  clusters   - [1 x c] cell array with corresponding clusters

IDD = w_1.*(1./ID) + w_2.*D;
% remove Inf in diagonal so that it doesn't connect to itself
IDD(isinf(IDD)) = 0;

% myIDD will be filled with IDD values as the devices enter into clusters
% so that the denominator in the equation is correctly calculated
myIDD = zeros(size(IDD));

m = size(IDD,1);

% put first device in it's own cluster
clusters = {};
clusters{1} = 1;

% repeat for all other devices
for ii = 2:m
    
    % fill myIDD to get the right denominator
    for jj = 1:size(clusters,2)
        myIDD = fill_myIDD(IDD,myIDD,ii,clusters{jj});
    end
    
    prob = calculate_probabilities(IDD, myIDD, a, ii, clusters);
    
    % round to remove decimal points after the 4th digit
    sum_prob=round((sum(prob)*10^4)/10^4);
    if sum_prob ~= 1.0
        double(sum(prob))
    end
    
    if sum_prob ~= 1
        error('Probabilities don''t sum up to one');
    end
    
    cluster_number = find_matching_cluster(prob);
    if cluster_number < size(prob,2)
        clusters{cluster_number} = [clusters{cluster_number}, ii];
    else
        clusters{cluster_number} = ii;
    end
    
end

end


function prob = calculate_probabilities(IDD, myIDD, a, ii, clusters)
    prob = zeros(1,size(clusters,2)+1);
    
    denominator = sum(myIDD, 2) + a;
    
    for jj = 1:size(clusters,2)
        numerator = calculate_numerator(IDD,ii,clusters{jj});
        prob(jj) = numerator/denominator(ii);
    end
    % probability it forms it's own cluster
    prob(size(clusters,2)+1) = a/denominator(ii);
end

function numerator = calculate_numerator(IDD, node, cluster)
    numerator = 0;
    
    for ii = 1:size(cluster,2)
        numerator = numerator + IDD(node,cluster(ii));
    end
end

function myIDD = fill_myIDD(IDD, myIDD, node,cluster)
    % This function fills the myIDD table with the nodes as they enter
    % into the clusters
    
    for ii = 1:size(cluster,2)
        myIDD(node,cluster(ii)) = IDD(node,cluster(ii));
        myIDD(cluster(ii),node) = IDD(node,cluster(ii));
    end
end

function cluster = find_matching_cluster(prob)

    cumsum_prob = cumsum(prob);
    
    ball = rand;
    
    matched = 0;
    for jj = 1:(size(cumsum_prob,2)-1)
        if ball < cumsum_prob(jj)
            cluster = jj;
            matched = 1;
            break;
        end
    end
    if matched == 0
        cluster = size(cumsum_prob,2);
    end    
end

