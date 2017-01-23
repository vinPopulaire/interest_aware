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
%  clusters   - [1 x X] cell array with corresponding clusters

IDD = w_1.*(1./ID) + w_2.*D;
% remove Inf in diagonal so that it doesn't connect to itself
IDD(isinf(IDD)) = 0;

myIDD = zeros(size(IDD));

% % The sum of the rows is Sum(IDD(m,m')) for all m' for a node m.
% sum_of_rows = sum(IDD, 2);
% 
% denominator = sum_of_rows + a;

m = size(IDD,1);

clusters = {};
clusters{1} = 1;

for ii = 2:m
    prob = zeros(1,size(clusters,2)+1);
    
    % fill myIDD to get the right denominator
    for jj = 1:size(clusters,2)
        myIDD = fill_myIDD(IDD,myIDD,ii,clusters{jj});
    end
    
    denominator = sum(myIDD, 2) + a;
    
    for jj = 1:size(clusters,2)
        [prob(jj)] = calculate_probability(IDD,myIDD,a,ii,clusters{jj},denominator);
    end
    % probability it forms it's own cluster
    prob(size(clusters,2)+1) = a/denominator(ii);
    
    % round to remove decimal points after the 4th digit
    sum_prob=round((sum(prob)*10^4)/10^4);
    if sum_prob ~= 1.0
        double(sum(prob))
    end
    
    if sum_prob ~= 1
        error('Probabilities don''t sum up to one');
    end
    
    cumsum_prob = cumsum(prob);
    
    ball = rand;
    
    matched = 0;
    for jj = 1:(size(cumsum_prob,2)-1)
        if ball < cumsum_prob(jj)
            clusters{jj} = [clusters{jj}, ii];
            matched = 1;
            break;
        end
    end
    if matched == 0
        clusters{size(cumsum_prob,2)} = ii;
    end
end

end

function [prob] = calculate_probability(IDD, myIDD, a, node, cluster, denominator)
%     sum_of_rows = sum(IDD, 2);
%     denominator = sum_of_rows + a;
    prob = 0;
    
    for ii = 1:size(cluster,2)
        prob = prob + IDD(node,cluster(ii));
    end
%     denominator = sum(myIDD, 2) + a;
    prob = prob/denominator(node);
end

function myIDD = fill_myIDD(IDD, myIDD, node,cluster)
    % This function fills the myIDD table with the nodes as they enter
    % into the clusters
    
    for ii = 1:size(cluster,2)
        myIDD(node,cluster(ii)) = IDD(node,cluster(ii));
        myIDD(cluster(ii),node) = IDD(node,cluster(ii));
    end
end

% function cluster = find_matching_cluster(IDD, a, clusters)
%     
%    
%         
% end

