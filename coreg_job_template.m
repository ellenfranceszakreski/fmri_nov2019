% append code after defining variable subx
% e.g. subx='sub2'

%% set up cluster
number_of_cores=12;
d=tempname();% get temporary directory location
mkdir(d);
% create cluster
cluster = parallel.cluster.Local('JobStorageLocation',d,'NumWorkers',number_of_cores);
matlabpool(cluster, number_of_cores);

%% run analysis
addpath(genpath(fullfile(spm('dir'),'config')));
AnalysisDir='/data/scratch/zakell/fmri_nov2019';
subxDir=fullfile(AnalysisDir,'Input',subx);
jobs = {fullfile(AnalysisDir,'Scripts','coreg_job.m')};
inputs{1,1} = {subxDir};
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
%% compress the output files
unix(sprintf('pigz %s', fullfile(subxDir, 'cw_*.nii')));
unix(sprintf('pigz %s', fullfile(subxDir, 'ce_*.nii')));

% save file to indicate completion
save(fullfile(subxDir,'coreg_done.mat'), 'jobs','-mat');
% done
