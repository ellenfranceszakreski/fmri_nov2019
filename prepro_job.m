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

matlabbatch{7}.spm.temporal.st.scans{1}(1) = cfg_dep('Realign & Unwarp: Unwarped Images (Sess 1)', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','uwrfiles'));
matlabbatch{7}.spm.temporal.st.scans{2}(1) = cfg_dep('Realign & Unwarp: Unwarped Images (Sess 2)', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','uwrfiles'));
matlabbatch{7}.spm.temporal.st.scans{3}(1) = cfg_dep('Realign & Unwarp: Unwarped Images (Sess 3)', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','uwrfiles'));
matlabbatch{7}.spm.temporal.st.nslices = 44;
matlabbatch{7}.spm.temporal.st.tr = 2.552;
matlabbatch{7}.spm.temporal.st.ta = 2.494;
matlabbatch{7}.spm.temporal.st.so = [1:2:43, 2:2:44]
matlabbatch{7}.spm.temporal.st.refslice = 22;
matlabbatch{7}.spm.temporal.st.prefix = 'a';

matlabbatch{8}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.parent(1) = cfg_dep('Named Directory Selector: subxDir(1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dirs', '{}',{1}));
matlabbatch{8}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.name = 'Output_au';
matlabbatch{9}.cfg_basicio.file_dir.file_ops.file_move.files(1) = cfg_dep('Realign & Unwarp: Unwarped Mean Image', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','meanuwr'));
matlabbatch{9}.cfg_basicio.file_dir.file_ops.file_move.files(2) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 1)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{9}.cfg_basicio.file_dir.file_ops.file_move.files(3) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 2)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{2}, '.','files'));
matlabbatch{9}.cfg_basicio.file_dir.file_ops.file_move.files(4) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 3)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{3}, '.','files'));
matlabbatch{9}.cfg_basicio.file_dir.file_ops.file_move.action.copyto(1) = cfg_dep('Make Directory: Make Directory ''Output_au''', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dir'));

matlabbatch{10}.spm.spatial.coreg.estimate.ref(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^sub\d+_n3_nlm.nii)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{10}.spm.spatial.coreg.estimate.source(1) = cfg_dep('Realign & Unwarp: Unwarped Mean Image', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','meanuwr'));
matlabbatch{10}.spm.spatial.coreg.estimate.other(1) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 1)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{10}.spm.spatial.coreg.estimate.other(2) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 2)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{2}, '.','files'));
matlabbatch{10}.spm.spatial.coreg.estimate.other(3) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 3)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{3}, '.','files'));
matlabbatch{10}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{10}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{10}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{10}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];

matlabbatch{11}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.parent(1) = cfg_dep('Named Directory Selector: subxDir(1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dirs', '{}',{1}));
matlabbatch{11}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.name = 'Output_coreg_est';

matlabbatch{12}.cfg_basicio.file_dir.file_ops.file_move.files(1) = cfg_dep('Coregister: Estimate: Coregistered Images', substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
matlabbatch{12}.cfg_basicio.file_dir.file_ops.file_move.action.copyto(1) = cfg_dep('Make Directory: Make Directory ''Output_coreg_est''', substruct('.','val', '{}',{11}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dir'));

matlabbatch{13}.spm.spatial.coreg.write.ref(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^sub\d+_n3_nlm.nii)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.coreg.write.source(1) = cfg_dep('Coregister: Estimate: Coregistered Images', substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
matlabbatch{13}.spm.spatial.coreg.write.roptions.interp = 7;
matlabbatch{13}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
matlabbatch{13}.spm.spatial.coreg.write.roptions.mask = 0;
matlabbatch{13}.spm.spatial.coreg.write.roptions.prefix = 'c';
