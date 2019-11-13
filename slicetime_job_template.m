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
matlabbatch=cell(1,1);
matlabbatch{1}.spm.temporal.st.scans = {'<UNDEFINED>'};
matlabbatch{1}.spm.temporal.st.nslices = 44;
matlabbatch{1}.spm.temporal.st.tr = 2.552;
matlabbatch{1}.spm.temporal.st.ta = 2.494;
matlabbatch{1}.spm.temporal.st.so = [1:2:43, 2:2:44];
matlabbatch{1}.spm.temporal.st.refslice = 22;
matlabbatch{1}.spm.temporal.st.prefix = 'a';
R=3;
jobs=repmat(matlabbatch,1,R);
inputs=cell(1,R);
for r=1:R
    inputs{1,r} = cellstr(spm_select('ExtFPList', subxDir, ['^usub\d+_run',num2str(r),'.nii'], 1:200));
end; clear r R
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
% save file to indicate completion
save(fullfile(subxDir,'slicetime_done.mat'), 'jobs','-mat');
% done
