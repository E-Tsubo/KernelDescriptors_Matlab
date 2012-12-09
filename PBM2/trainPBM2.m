function [ combinePBM, maxvalue, minvalue, trainfea ] = trainPBM2( partmodel )
%% Part-Based SVM (Combine SVM) Train Program
%% 2012/11/26 Written by Hideshi T.
global path;
path = '../Evaluate/rgbdsubset/';

USE_PART_MODEL = length( partmodel );
%TRAIN_USE_PART_FEATURE = 4;
trainfea = [];

%% load train features...
if 0
for i = 1:USE_PART_MODEL
    num = length( partmodel{i} );
    
    if num == 1
        num_fea = num;
    else
        num_fea = num - 1;
    end
    
    for j = 1:num_fea
        type = partmodel{i}{j}.kdes.kdes_params.type;
        part = partmodel{i}{j}.part;
        disp( [ 'Loading features...  ' type '  ' part ] );
        trainfea{i}{j} = loadFeature( type, part );
        
    end
end
end

%% Collecting Part Component Score (decision value)
addpath('../liblinear-1.91-original/matlab');
addpath('../libsvm-3.12-original/matlab');
%addpath('../liblinear-1.5-dense-float/matlab');

addpath('../helpfun');
addpath('../kdes');
addpath('../emk');
addpath('../myfun');

%% Training Support Vector Machine ( Combine Part Model )...
if 0
for i = 1:USE_PART_MODEL % Part Model index
    disp( ' ' );
    disp( [ 'Part-Model No. is ' num2str(i) ] );
    
    tmp_model = partmodel{i}{end}.matlab.model;
    tmp_min = partmodel{i}{end}.svm.minvalue;
    tmp_max = partmodel{i}{end}.svm.maxvalue;
        
    for j = 1:USE_PART_MODEL % Train Feature index
        disp( [ '------> Train Feature Part No. is ' num2str(j) ] );
        
        tmp_fea = [];
        for k = 1:num_fea
            tmp_fea = [ tmp_fea; trainfea{j}{k}.rgbdfea ];
        end
        tmp_label = trainfea{j}{1}.rgbdclabel;
    
        tmp_fea = double( tmp_fea );
        tmp_fea = sparse( tmp_fea );
        tmp_fea = scaletest( tmp_fea, 'linear', tmp_min, tmp_max );
        [ predictlabel{i,j}, accuracy{i,j}, decvalues{i,j} ] = predict( tmp_label', tmp_fea', tmp_model );
    end
    
end
end
%% %%%%%%%%%%

%% Training Combine SVM from Part Component Score

% arrange training set from part-component score
% decvalues{1,2}(1,2) 
%decvalues{partmodel indx, parttrainfea idx}(trainidx,label)
if 0
combinelabel = [];
combinefea   = [];

for h = 1:USE_PART_MODEL %Part-Model Index
    cnt = 1;
    for i = 1:USE_PART_MODEL %Part-Train Feature Index
        for j = 1:length(trainfea{i}{1}.rgbdclabel) %Train Fea Instance Index
            for k = 1:partmodel{1}{1}.svm.nr_class %Class Index
                cidx = trainfea{i}{1}.rgbdclabel(j);
                combinefea( cnt, (k-1)*USE_PART_MODEL + h ) = decvalues{h, i}(j, k);
                combinelabel( cnt ) = cidx;
            end
            cnt = cnt + 1;
        end
    end
end

save combinefeature.mat combinefea combinelabel
else
    load combinefeature;
end
disp( ' Learning... ' );


%Liblinear
combinefea = combinefea';
combinefea = sparse( combinefea );
[combinefea, minvalue, maxvalue] = scaletrain(combinefea, 'linear');
%{
lc = 30.0;
option = ['-s 1 -c ' num2str(lc)];
combinePBM = train(combinelabel', combinefea', option);
%}


%Libsvm
%combinefea = combinefea';
%[combinefea, minvalue, maxvalue] = scaletrain(combinefea, 'linear');

gridsearch = 1;
if gridsearch
    
    %{
    bestcv = 0;
    bestc = 0;
    bestg = 0;
    for log2c = -1:2:3,
        for log2g = -4:2:1,
            cmd = ['-s 0 -t 2 -v 2 -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
            cv = svmtrain(combinelabel', combinefea', cmd);
            if (cv >= bestcv),
                bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
            end
        fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
        end
    end
    option = ['-b 1 -s 0 -t 2 -c ' num2str(bestc) ' -g ' num2str(bestg)];
    combinePBM = svmtrain(combinelabel', combinefea', option);
    fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
    %}
    
     bestcv = 0;
     bestc = 0;
     for log2c = -5:2:15
        cmd = ['-s 1 -v 5 -c ', num2str(2^log2c) ];
        cv = train(combinelabel', combinefea', cmd);
        if (cv >= bestcv),
            bestcv = cv; bestc = 2^log2c;
        end
        fprintf('%g %g (best c=%g, rate=%g)\n', log2c, cv, bestc, bestcv);
     end
     option = ['-s 1 -c ' num2str(bestc) ];
     combinePBM = train(combinelabel', combinefea', option);
     fprintf('%g %g (best c=%g, rate=%g)\n', log2c, cv, bestc, bestcv);
    
else
    c = 2^3; g = 2^1;
    option = ['-b 1 -s 0 -t 2 -c ' num2str(c) ' -g ' num2str(g)];
    combinePBM = svmtrain(combinelabel', combinefea', option);
end
%{ 
%% MEMO:LIBSVM OPTION %%

options:
-s svm_type : set type of SVM (default 0)
	0 -- C-SVC
	1 -- nu-SVC
	2 -- one-class SVM
	3 -- epsilon-SVR
	4 -- nu-SVR
-t kernel_type : set type of kernel function (default 2)
	0 -- linear: u'*v
	1 -- polynomial: (gamma*u'*v + coef0)^degree
	2 -- radial basis function: exp(-gamma*|u-v|^2)
	3 -- sigmoid: tanh(gamma*u'*v + coef0)
-d degree : set degree in kernel function (default 3)
-g gamma : set gamma in kernel function (default 1/num_features)
-r coef0 : set coef0 in kernel function (default 0)
-c cost : set the parameter C of C-SVC, epsilon-SVR, and nu-SVR (default 1)
-n nu : set the parameter nu of nu-SVC, one-class SVM, and nu-SVR (default 0.5)
-p epsilon : set the epsilon in loss function of epsilon-SVR (default 0.1)
-m cachesize : set cache memory size in MB (default 100)
-e epsilon : set tolerance of termination criterion (default 0.001)
-h shrinking: whether to use the shrinking heuristics, 0 or 1 (default 1)
-b probability_estimates: whether to train a SVC or SVR model for probability estimates, 0 or 1 (default 0)
-wi weight: set the parameter C of class i to weight*C, for C-SVC (default 1)

The k in the -g option means the number of attributes in the input data.
%}

function [ fea ] = loadFeature( type, part )
global path;

tmp_path = [];
switch type
    
    case 'rgbkdes'
        name = 'rgbdfea_rgb_rgbkdes.mat';
        tmp_path = [ path part '/' name ];
        fea = load(tmp_path);
        disp( [ '-----> ' name '  ' tmp_path ]);
    case 'gradkdes'
        name = 'rgbdfea_rgb_gradkdes.mat';
        tmp_path = [ path part '/' name ];
        fea = load(tmp_path);
        disp( [ '-----> ' name '  ' tmp_path ]);
    case 'gradkdes_dep'
        name = 'rgbdfea_depth_gradkdes.mat';
        tmp_path = [ path part '/' name ];
        fea = load(tmp_path);
        disp( [ '-----> ' name '  ' tmp_path ]);
    case 'normalkdes'
        name = 'rgbdfea_pcloud_normalkdes.mat';
        tmp_path = [ path part '/' name ];
        fea = load(tmp_path);
        disp( [ '-----> ' name '  ' tmp_path ]);
end