clear all
close all
clc

RoiNames = {'%provide ROI name'};
DataDirs{1} = %provide data path;
result_dir = %define output path;
Kvals = 2:10; % k numbers
subject_list = %provide subject list;

%%%%%%%%%%%%%%%%% Extract Time Series  %%%%%%%%%%%%%%%%%%%%%%%%%
roidir = strcat(DataDirs{1},'ROIs');
TR = %TR value;
Extract_VoxelWise_TimeSeries(DataDirs{1},roidir,RoiNames(1),subject_list,TR);
%matlabpool local 8
for roi = 1:length(RoiNames)
    %fprintf('Kmeans Consensus Clustering........\n')
    main_kmeans_BASC(DataDirs{1}, result_dir, RoiNames(1),subject_list);
    fprintf('Computing I for ROI = %s \n',RoiNames{roi})
    compute_indvidual_stability_matrix_I(result_dir, result_dir, RoiNames{roi}, subject_list)
    fprintf('Computing Cluster Labels from I for ROI = %s \n', RoiNames{roi})
    get_labels_I(result_dir,RoiNames(roi),subject_list,Kvals);
end
%matlabpool close

