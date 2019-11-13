% append code after defining variable subx
% e.g. subx='sub2'

AnalysisDir='/data/scratch/zakell/fmri_nov2019';
subxDir=fullfile(AnalysisDir,'Input',subx);
if exist(fullfile(subxDir,'realign_done.mat'),'file')~=2
  warning('efz:missing_step', 'realignment not done yet.');
  exit
end

%% set up cluster
number_of_cores=12;
d=tempname();% get temporary directory location
mkdir(d);
% create cluster
cluster = parallel.cluster.Local('JobStorageLocation',d,'NumWorkers',number_of_cores);
matlabpool(cluster, number_of_cores);

%% run analysis
addpath(genpath(fullfile(spm('dir'),'config')));
jobs = {fullfile(AnalysisDir,'Scripts','slicetime_job.m')};
inputs{1,1} = {subxDir};
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
% save file to indicate completion
save(fullfile(subxDir,'slicetime_done.mat'), 'jobs','-mat');
% done