function [centrality] = st_biased_random_walk_BC(A, n, s, t)
%This function assumes the following:
%   1) A is a sparse matrix
%   2) Every node has finite distance to node t

dist = graphshortestpath(A', t) + 1;
%dist = ones(1,n);
dist_inv = dist.^(-1);

W = spdiags([dist_inv'], 0, n,n);
A = A*W;
d = A*ones(n,1);
D = spdiags([d], 0, n,n);
D(t,t) = 1;
M = D\A;
A_t = A;
D_t = D;
D_t(t,:) = [];
D_t(:,t) = [];
A_t(t,:) = [];
A_t(:,t) = [];
D_t_inv = D_t^(-1);
M_t = D_t\A_t;
I_t = speye(n-1);
Z_t = (I_t - M_t)\speye(n-1,n-1);
s_index = sparse(1,n);
s_index(s) = 1;
Z  = sparse(n,n);
Z(1:n-1, 1:n-1) = Z_t;
V = s_index*Z;
D_V = spdiags([V'], 0, n,n);
flow_mat = D_V*M;
G = digraph(flow_mat);
plot(G,'EdgeLabel',G.Edges.Weight)
net_flow_mat = abs(flow_mat - flow_mat');
centrality = 0.5*net_flow_mat*ones(n,1);
%centrality = (s_index*TA)';
%centrality(s) = 1;
%centrality(t) = 1;
%{
T_t = (I_t - M_t)\D_t_inv;
T = zeros(n,n);
T(1:n-1,1:n-1)= T_t;
F = diag(s_index*T);
flow = F*A;
G = digraph(flow);
plot(G,'EdgeLabel',G.Edges.Weight)
%}
end