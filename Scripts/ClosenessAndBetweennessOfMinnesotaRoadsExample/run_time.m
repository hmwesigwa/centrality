load('grid10x10.mat')
[~,n] = size(A);
tic
wcc = RW_centrality_rand_install(A,4,10);
toc