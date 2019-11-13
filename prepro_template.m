% append code after defining variable subx
% e.g. subx='sub2'
addpath(genpath(fullfile(spm('dir'),'config')));
AnalysisDir='/data/scratch/zakell/fmri_nov2019';
jobs = {fullfile(AnalysisDir,'prepro_job.m')};
inputs{1,1} = {fullfile(AnalysisDir,'Input',subx)};
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
% done
