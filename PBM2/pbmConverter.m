%% Convert C-Model to Matlab-Model
addpath('../SVM_C_Platform/svm_matlab2c-master/');
addpath('../kdes');
addpath('../helpfun');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Please Edit...
ROOT_PATH='../Evaluate/rgbdsubset/';
USE_PART_MODEL = 5;

part{1} = 'full';
mName{1} = 'full.model';%%C Liblinear Model Name...
%mFea{1} = 'f_rgbdfea_joint.mat';

part{2} = 'left';
mName{2} = 'left.model';
%mFea{2} = 'l_rgbdfea_joint.mat');

part{3} = 'right';
mName{3} = 'right.model';
%mFea{3} = 'r_rgbdfea_joint.mat';

part{4} = 'top';
mName{4} = 'top.model';
%mFea{4} = 't_rgbdfea_joint.mat';

part{5} = 'bottom';
mName{5} = 'bottom.model';
%mFea{5} = 'b_rgbdfea_joint.mat');

part{6} = 'pbm';
mName{6} = 'pbm.model';
mFea{6} = 'pbmFea.txt';

%{
featurenum = [ 5 5 5 5 5 ];
feature{1,1}='gradkdes'; feature{1,2}='rgbkdes'; feature{1,3}='gradkdes_dep'; feature{1,4}='normalkdes';
feature{2,1}='gradkdes'; feature{2,2}='rgbkdes'; feature{2,3}='gradkdes_dep'; feature{2,4}='normalkdes';
feature{3,1}='gradkdes'; feature{3,2}='rgbkdes'; feature{3,3}='gradkdes_dep'; feature{3,4}='normalkdes';
feature{4,1}='gradkdes'; feature{4,2}='rgbkdes'; feature{4,3}='gradkdes_dep'; feature{4,4}='normalkdes';
feature{5,1}='gradkdes'; feature{5,2}='rgbkdes'; feature{5,3}='gradkdes_dep'; feature{5,4}='normalkdes';
input{1,1}='rgb'; input{1,2}='rgb'; input{1,3}='dep'; input{1,4}='dep';
input{2,1}='rgb'; input{2,2}='rgb'; input{2,3}='dep'; input{2,4}='dep';
input{3,1}='rgb'; input{3,2}='rgb'; input{3,3}='dep'; input{3,4}='dep';
input{4,1}='rgb'; input{4,2}='rgb'; input{4,3}='dep'; input{4,4}='dep';
input{5,1}='rgb'; input{5,2}='rgb'; input{5,3}='dep'; input{5,4}='dep';
%}

featurenum = [ 1 1 1 1 1 ];
feature{1,1}='gradkdes_dep'; 
feature{2,1}='gradkdes_dep'; 
feature{3,1}='gradkdes_dep'; 
feature{4,1}='gradkdes_dep'; 
feature{5,1}='gradkdes_dep'; 
input{1,1}='dep';
input{2,1}='dep';
input{3,1}='dep';
input{4,1}='dep';
input{5,1}='dep';

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:USE_PART_MODEL
    
    if featurenum(i) == 1 
        
        %part
        tpartmodel{1,1}.part = part{i};
        %input
        tpartmodel{1,1}.inputdata=input{i,1};
        
        %kdes
        if( strcmp( feature{i,1}, 'gradkdes' ) )
            load('gradkdes_params');
            tpartmodel{1,1}.kdes.kdes_params = gradkdes_params;
            tpartmodel{1,1}.kdes.min_imsize = 45;
            tpartmodel{1,1}.kdes.max_imsize = 300;
            tpartmodel{1,1}.kdes.grid_space = 8;
            tpartmodel{1,1}.kdes.patch_size = 16;
        end
        if( strcmp( feature{i,1}, 'rgbkdes' ) )
            load('rgbkdes_params');
            tpartmodel{1,1}.kdes.kdes_params = rgbkdes_params;
            tpartmodel{1,1}.kdes.min_imsize = 45;
            tpartmodel{1,1}.kdes.max_imsize = 300;
            tpartmodel{1,1}.kdes.grid_space = 8;
            tpartmodel{1,1}.kdes.patch_size = 16;
        end
        if( strcmp( feature{i,1}, 'gradkdes_dep' ) )
            load('gradkdes_dep_params');
            tpartmodel{1,1}.kdes.kdes_params = gradkdes_dep_params;
            tpartmodel{1,1}.kdes.min_imsize = 45;
            tpartmodel{1,1}.kdes.max_imsize = 300;
            tpartmodel{1,1}.kdes.grid_space = 8;
            tpartmodel{1,1}.kdes.patch_size = 16;
        end
        if( strcmp( feature{i,1}, 'normalkdes' ) )
            load('gradkdes_params');
            tpartmodel{1,1}.kdes.kdes_params = normalkdes_params;
            tpartmodel{1,1}.kdes.min_imsize = 45;
            tpartmodel{1,1}.kdes.max_imsize = 300;
            tpartmodel{1,1}.kdes.grid_space = 8;
            tpartmodel{1,1}.kdes.patch_size = 40;
        end
        
        %emk
        emk_params.pyramid = [ 1 2 3 ];
        emk_params.ktype = 'rbf';
        tpartmodel{1,1}.emk = emk_params
        if( strcmp( feature{i,1}, 'gradkdes' ) )
            tpartmodel{1,1}.emk.kparam = 0.1;
            tmpfea=load([ROOT_PATH part{i} '/rgbdfea_rgb_gradkdes.mat']);
        end
        if( strcmp( feature{i,1}, 'rgbkdes' ) )
            tpartmodel{1,1}.emk.kparam = 0.001;
            tmpfea=load([ROOT_PATH part{i} '/rgbdfea_rgb_rgbkdes.mat']);
        end
        if( strcmp( feature{i,1}, 'gradkdes_dep' ) )
            tpartmodel{1,1}.emk.kparam = 0.001;
            tmpfea=load([ROOT_PATH part{i} '/rgbdfea_depth_gradkdes.mat']);
        end
        if( strcmp( feature{i,1}, 'normalkdes' ) )
            tpartmodel{1,1}.emk.kparam = 0.01;
            tmpfea=load([ROOT_PATH part{i} '/rgbdfea_pcloud_normalkdes.mat']);
        end
        
        tpartmodel{1,1}.emk.words = tmpfea.rgbdwords;
        tpartmodel{1,1}.emk.G = tmpfea.G;
            
        if( exist( 'tmpfea.minvalue', 'var' ) == 0 )
            [tmpfea.tmp, tmpfea.minvalue, tmpfea.maxvalue] = scaletrain(tmpfea.rgbdfea, 'linear'); 
        end
        
        %matlab
        tpartmodel{1,1}.matlab.model = liblinear2mat([ROOT_PATH part{i} '/' mName{i}]);
        
        %svm
        load classname.mat;
        tpartmodel{1,1}.svm = tpartmodel{1,1}.matlab.model;
        tpartmodel{1,1}.svm.classname = classname;
        tpartmodel{1,1}.svm.minvalue = tmpfea.minvalue;
        tpartmodel{1,1}.svm.maxvalue = tmpfea.maxvalue;
        
        partmodel{i} = tpartmodel;
        clear tpartmodel;
    else
        
        for j = 1:featurenum(i)-1
            
            %part
            tpartmodel{j,1}.part = part{i};
            %input
            tpartmodel{j,1}.inputdata=input{i,j};
        
            %kdes
            if( strcmp( feature{i,j}, 'gradkdes' ) )
                load('gradkdes_params');
                tpartmodel{j,1}.kdes.kdes_params = gradkdes_params;
                tpartmodel{j,1}.kdes.min_imsize = 45;
                tpartmodel{j,1}.kdes.max_imsize = 300;
                tpartmodel{j,1}.kdes.grid_space = 8;
                tpartmodel{j,1}.kdes.patch_size = 16;
            end
            if( strcmp( feature{i,j}, 'rgbkdes' ) )
                load('rgbkdes_params');
                tpartmodel{j,1}.kdes.kdes_params = rgbkdes_params;
                tpartmodel{j,1}.kdes.min_imsize = 45;
                tpartmodel{j,1}.kdes.max_imsize = 300;
                tpartmodel{j,1}.kdes.grid_space = 8;
                tpartmodel{j,1}.kdes.patch_size = 16;
            end
            if( strcmp( feature{i,j}, 'gradkdes_dep' ) )
                load('gradkdes_dep_params');
                tpartmodel{j,1}.kdes.kdes_params = gradkdes_dep_params;
                tpartmodel{j,1}.kdes.min_imsize = 45;
                tpartmodel{j,1}.kdes.max_imsize = 300;
                tpartmodel{j,1}.kdes.grid_space = 8;
                tpartmodel{j,1}.kdes.patch_size = 16;
            end
            if( strcmp( feature{i,j}, 'normalkdes' ) )
                load('normalkdes_params');
                tpartmodel{j,1}.kdes.kdes_params = normalkdes_params;
                tpartmodel{j,1}.kdes.min_imsize = 45;
                tpartmodel{j,1}.kdes.max_imsize = 300;
                tpartmodel{j,1}.kdes.grid_space = 8;
                tpartmodel{j,1}.kdes.patch_size = 40;
            end
        
            %emk
            emk_params.pyramid = [ 1 2 3 ];
            emk_params.ktype = 'rbf';
            tpartmodel{j,1}.emk = emk_params;
            if( strcmp( feature{i,j}, 'gradkdes' ) )
                tpartmodel{j,1}.emk.kparam = 0.1;
                tmpfea=load([ROOT_PATH part{i} '/rgbdfea_rgb_gradkdes.mat']);
            end
            if( strcmp( feature{i,j}, 'rgbkdes' ) )
                tpartmodel{j,1}.emk.kparam = 0.001;
                tmpfea=load([ROOT_PATH part{i} '/rgbdfea_rgb_rgbkdes.mat']);
            end
            if( strcmp( feature{i,j}, 'gradkdes_dep' ) )
                tpartmodel{j,1}.emk.kparam = 0.001;
                tmpfea=load([ROOT_PATH part{i} '/rgbdfea_depth_gradkdes.mat']);
            end
            if( strcmp( feature{i,j}, 'normalkdes' ) )
                tpartmodel{j,1}.emk.kparam = 0.01;
                tmpfea=load([ROOT_PATH part{i} '/rgbdfea_pcloud_normalkdes.mat']);
            end
            tpartmodel{j,1}.emk.words = tmpfea.rgbdwords;
            tpartmodel{j,1}.emk.G = tmpfea.G;
        end
        
        % Joint-Feature
        idx = featurenum(i);
        %matlab
        tpartmodel{idx,1}.matlab.model = liblinear2mat([ROOT_PATH part{i} '/' mName{i}]);
        %part
        tpartmodel{idx,1}.part = part{i};
        %input
        tpartmodel{idx,1}.inputdata='combine';
        
        tmpfea=load([ROOT_PATH part{i} '/rgbdfea_joint.mat']);
        %tmpfea = load(mFea{i});
        if( exist( 'tmpfea.minvalue', 'var' ) == 0 )
            [tmpfea.tmp, tmpfea.minvalue, tmpfea.maxvalue] = scaletrain(tmpfea.rgbdfea, 'linear'); 
        end
        
        %matlab
        %tpartmodel{idx,1}.matlab.model = liblinear2mat(mName{i});
        
        %svm
        classname = load('classname');
        tpartmodel{idx,1}.svm = tpartmodel{idx,1}.matlab.model;
        tpartmodel{idx,1}.svm.classname = classname.classname;
        tpartmodel{idx,1}.svm.minvalue = tmpfea.minvalue;
        tpartmodel{idx,1}.svm.maxvalue = tmpfea.maxvalue;
        
        partmodel{i,1} = tpartmodel';
        clear tpartmodel;
    end
end

for i = 1:USE_PART_MODEL
    PBM.partdetector.partmodel{i} = partmodel{i};
    PBM.partdetector.featurenum(i) = featurenum(i);
    if PBM.partdetector.featurenum(i) ~= 1
        NUM = PBM.partdetector.featurenum(i) - 1;
    else
        NUM = PBM.partdetector.featurenum(i);
    end
    
    for j = 1:NUM
       PBM.partdetector.feature{i,j} = feature{i,j};%'?kdes_type';
       PBM.partdetector.input{i,j} = input{i,j};%'rgb or dep';
    end
end

PBM.combinedetector.svm = liblinear2mat([ROOT_PATH part{end} '/' mName{end}]);
PBM.combinedetector.svm.classname = classname;
PBM.combinedetector.maxvalue = load([ROOT_PATH part{end} '/pbm_maxvalue.txt']);
PBM.combinedetector.minvalue = load([ROOT_PATH part{end} '/pbm_minvalue.txt']);
PBM.combinedetector.maxvalue = PBM.combinedetector.maxvalue';
PBM.combinedetector.minvalue = PBM.combinedetector.minvalue';
