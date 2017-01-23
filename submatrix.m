function sub = submatrix(matrix,S)

% USAGE
%   sub = submatrix(matrix,S)
%
% INPUTS
%  matrix   - the original matrix
%  S        - the devices in the resulting matrix
%
% OUTPUTS
%  sub      - [n x n] resulting submatrix with the corresponding cols and
%             rows

sub = matrix(S,S);

end

