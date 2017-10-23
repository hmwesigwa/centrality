B  = [1 0 -1 0 0 0
    -1 1 0 0 0 0
    0 -1 0 -1 0 1
    0 0 1 1 1 0
    0 0 0 0 -1 -1];
L = B*B';

D = diag(diag(L));
A = D - L;
A(2,1) = 0;
A(1,4) = 0;
A(3,2) = 0;
A(3,4) = 0;
A(5,4) = 0;
A(5,3) = 0;
D_p = diag(A*ones(5,1));
L_p = D_p - A;
%C = diag([1,1,10000,1,1,1]);
%L = B*C*B';
%G = graph(A);

L_t = L_p;
L_t(5,:) = [];
L_t(:, 5) = [];
s_t = [1 0 0 0]';
s = [1 0 0 0 0]';
V_t = L_t\s_t;
V = zeros(5,1);
V(1:4) = V_t;
f = B'*V;


%%
A =[  0     1     1     0
     0     0     1     1
     0     0     0     1
     0     0     0     0];
%%
A =[0 1 0 0 0 0 0 0
   0 0 1 0 1 0 0 0
   1 0 0 1 0 0 0 0
   0 1 0 0 1 0 0 0
   0 0 0 0 0 1 1 0
   0 0 0 0 0 0 0 1
   0 0 0 0 0 1 0 1
   0 0 0 0 0 0 0 0];
%%
A = [0 1 1 1 1 1 0 0 0 0
    1 0 1 1 1 0 0 0 0 0 
    1 1 0 1 1 0 0 0 0 0
    1 1 1 0 1 0 0 0 0 0 
    1 1 1 1 0 0 0 0 0 0
    1 0 0 0 0 0 1 1 1 1
    0 0 0 0 0 1 0 1 1 1
    0 0 0 0 0 1 1 0 1 1
    0 0 0 0 0 1 1 1 0 1
    0 0 0 0 0 0 0 0 0 0];

%%
[~,n] = size(A);
D = diag(A*ones(n,1));
L = D - A;
L_t = L;
L_t(n,:) = [];
L_t(:,n) = [];
T_t = L_t^(-1);
T = zeros(n,n);
T(1:n-1,1:n-1)= T_t;
s = zeros(1,n);
s(1) = 1;
V = s*T*A;
%%
A = [0 1 0 
    1 0 1
    0 0 0];

%%
A = [0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0 
    0 1 0 1 0 0 0 0 
    0 0 0 0 1 0 0 0
    0 0 0 0 0 1 1 0
    0 0 0 1 0 0 0 0
    0 0 0 0 0 0 0 1
    0 0 0 0 0 0 0 0];

%%
A = [0 1 1 1 0 0 0 0 0 0 0
    1 0 1 0 1 0 0 0 0 0 0
    1 1 0 1 0 1 0 0 0 0 0
    1 0 1 0 0 0 1 0 0 0 0
    0 1 0 0 0 1 0 1 0 0 0
    0 0 1 0 1 0 1 0 1 0 0
    0 0 0 1 0 1 0 0 0 1 0
    0 0 0 0 1 0 0 0 1 0 1
    0 0 0 0 0 1 0 1 0 1 1
    0 0 0 0 0 0 1 0 1 0 1
    0 0 0 0 0 0 0 0 0 0 0];
%%
A = [0 1 1 1 1 1 0 0 0 0 1
    1 0 1 1 1 0 0 0 0 0 0
    1 1 0 1 1 0 0 0 0 0 0
    1 1 1 0 1 0 0 0 0 0 0
    1 1 1 1 0 0 0 0 0 0 0
    1 0 0 0 0 0 1 1 1 1 1
    0 0 0 0 0 1 0 1 1 1 0
    0 0 0 0 0 1 1 0 1 1 0
    0 0 0 0 0 1 1 1 0 1 0
    0 0 0 0 0 0 0 0 0 0 0
    1 0 0 0 0 1 0 0 0 0 0];
A = sparse(A);
%%
[~,n] = size(A);
D = diag(A*ones(n,1));
L = D - A;
L_t = L;
L_t(n,:) = [];
L_t(:,n) = [];
T_t = L_t^(-1);
T = zeros(n,n);
T(1:n-1,1:n-1)= T_t;
s = zeros(1,n);
s(1) = 1;
F = diag(s*T);
flow = F*A;
G = digraph(flow);
plot(G,'EdgeLabel',G.Edges.Weight)