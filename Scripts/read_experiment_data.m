function[] = read_experiment_data()
%{
data to read:
    1. graphfile
    2. sourcenodes
    3. st pairs
    4. install_nodes
    5. walks
%}
%myCluster=parcluster('local');
%parpool(myCluster,myCluster.NumWorkers);
load('davis_southern_women_graph.mat');
A(A>0) = 1;
full_soc = 3;
%  read files from dir
mydir = ['/home/hushiji/Research/centrality/'...
'Scripts/python_scripts/congestion/pre_data/example/randomwalks/'];
files = dir(strcat(mydir, '*.txt'));
[no_pair_files, ~] = size(files);
no_pair_files = no_pair_files/3;
ratio_scene = zeros(no_pair_files, 2);
row = 1;
for file = files'  % what files are in local dir 
    if file.name(1:7) == 'install'
        r_s = regexp(file.name,'\d*','Match');
        ratio_scene(row, 1) = str2num(cell2mat(r_s(1)));
        ratio_scene(row, 2) = str2num(cell2mat(r_s(2)));
        row = row + 1;
    end
end
%install_nodes
%st_pairs
katzdir  = ['/home/hushiji/Research/centrality/'...
'Scripts/python_scripts/congestion/post_data/example/randomwalks/'];
for row = 1:no_pair_files
    ratio = num2str(ratio_scene(row, 1));
    scenario = num2str(ratio_scene(row, 2));
    filetag = strcat(ratio, '_',scenario, '.txt');
    installfile = strcat(mydir, 'install', filetag);
    stfile = strcat(mydir, 'source_target', filetag);
    st_array = load(stfile);
    install_array = load(installfile);
    [centrality] = sample_st_randomwalkBC(A, st_array,...
    install_array, full_soc);
    katzfile = strcat(katzdir, 'katz',filetag);
    katzfile
    fileID = fopen(katzfile, 'w');
    fprintf(fileID,'%f\n',centrality);
    fclose(fileID);
end
centrality
end