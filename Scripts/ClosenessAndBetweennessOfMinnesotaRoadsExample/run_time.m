load('grid10x10.mat')
[~,n] = size(A);
wcc = RW_centrality_rand_install(A,3,n);