clear all
close all
clc

data_dir = % provide parcellation result path;
roiname = % provide ROI name;
prefix_fname = % provide prefix name;
roidir = data_dir;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
result_dir = % provide output path;


Kvals = 2:10;
subject_list = % provide subject;
%%%%%%%%%% VI & NMI  %%%%%%%%%%%
[mean_VI, std_VI, mean_NMI,std_NMI] =  compute_VI(data_dir,roiname,Kvals);
 %%%%%%%% RI & PRI %%%%%%%%%%%%
[mean_RI, mean_PRI] = compute_PRI(data_dir,roiname,Kvals);
% %%%%%%%%% Silhouette %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mean_Silhouette = compute_sigmas(result_dir,roiname,Kvals,subject_list);

fname = strcat(result_dir, 'Performance-Measures-',roiname{1},'.mat');
save(fname, 'mean_VI', 'mean_NMI', 'std_NMI','mean_RI', 'mean_PRI','mean_Silhouette')
%load(fname)

subplot(321)
plot(Kvals,mean_VI,'o-')
ylabel('Mean VI')
subplot(323)
plot(Kvals,mean_NMI,'o-')
ylabel('Mean NMI')
xlabel('Cluster Number')
subplot(324)
plot(Kvals,std_NMI,'o-')
ylabel('Standard Deviation NMI')
xlabel('Cluster Number')
subplot(325)
plot(Kvals,mean_RI,'o-')
ylabel('Mean RI')
xlabel('Cluster Number')
subplot(326)
plot(Kvals,mean_PRI,'o-')
ylabel('Mean PRI')
 subplot(322)
 plot(Kvals,mean_Silhouette,'o-')
 ylabel('Mean Silhouette')

Kopt = input('Kopt = ')
Cluster_G(data_dir,result_dir,roiname, subject_list,Kopt,roidir,prefix_fname,coods_dir);
