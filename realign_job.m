matlabbatch{1}.cfg_basicio.file_dir.dir_ops.cfg_named_dir.name = 'subxDir';
matlabbatch{1}.cfg_basicio.file_dir.dir_ops.cfg_named_dir.dirs = {'<UNDEFINED>'};

matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.dir(1) = cfg_dep('Named Directory Selector: subxDir(1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dirs', '{}',{1}));
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^sub\d+_run1.nii';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';

matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.dir(1) = cfg_dep('Named Directory Selector: subxDir(1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dirs', '{}',{1}));
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^sub\d+_run2.nii';
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';

matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.dir(1) = cfg_dep('Named Directory Selector: subxDir(1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dirs', '{}',{1}));
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^sub\d+_run3.nii';
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';

matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_fplist.dir(1) = cfg_dep('Named Directory Selector: subxDir(1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dirs', '{}',{1}));
matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^sub\d+_n3_nlm.nii';
matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';

matlabbatch{6}.spm.spatial.realignunwarp.data(1).scans(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^sub\d+_run1.nii)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{6}.spm.spatial.realignunwarp.data(1).pmscan = '';
matlabbatch{6}.spm.spatial.realignunwarp.data(2).scans(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^sub\d+_run2.nii)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{6}.spm.spatial.realignunwarp.data(2).pmscan = '';
matlabbatch{6}.spm.spatial.realignunwarp.data(3).scans(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^sub\d+_run3.nii)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{6}.spm.spatial.realignunwarp.data(3).pmscan = '';
matlabbatch{6}.spm.spatial.realignunwarp.eoptions.quality = 1;
matlabbatch{6}.spm.spatial.realignunwarp.eoptions.sep = 3;
matlabbatch{6}.spm.spatial.realignunwarp.eoptions.fwhm = 5;
matlabbatch{6}.spm.spatial.realignunwarp.eoptions.rtm = 0;
matlabbatch{6}.spm.spatial.realignunwarp.eoptions.einterp = 7;
matlabbatch{6}.spm.spatial.realignunwarp.eoptions.ewrap = [0 0 0];
matlabbatch{6}.spm.spatial.realignunwarp.eoptions.weight = '';
matlabbatch{6}.spm.spatial.realignunwarp.uweoptions.basfcn = [12 12];
matlabbatch{6}.spm.spatial.realignunwarp.uweoptions.regorder = 1;
matlabbatch{6}.spm.spatial.realignunwarp.uweoptions.lambda = 100000;
matlabbatch{6}.spm.spatial.realignunwarp.uweoptions.jm = 0;
matlabbatch{6}.spm.spatial.realignunwarp.uweoptions.fot = [4 5];
matlabbatch{6}.spm.spatial.realignunwarp.uweoptions.sot = [];
matlabbatch{6}.spm.spatial.realignunwarp.uweoptions.uwfwhm = 4;
matlabbatch{6}.spm.spatial.realignunwarp.uweoptions.rem = 1;
matlabbatch{6}.spm.spatial.realignunwarp.uweoptions.noi = 5;
matlabbatch{6}.spm.spatial.realignunwarp.uweoptions.expround = 'Average';
matlabbatch{6}.spm.spatial.realignunwarp.uwroptions.uwwhich = [2 1];
matlabbatch{6}.spm.spatial.realignunwarp.uwroptions.rinterp = 7;
matlabbatch{6}.spm.spatial.realignunwarp.uwroptions.wrap = [0 0 0];
matlabbatch{6}.spm.spatial.realignunwarp.uwroptions.mask = 1;
matlabbatch{6}.spm.spatial.realignunwarp.uwroptions.prefix = 'u';
