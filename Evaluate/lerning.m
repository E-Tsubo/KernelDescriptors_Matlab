%% 2012/11/16 Written by Hidesh T. @DHRC
%% SVM learning program

%clear;

SVM_TYPE = 1;
if SVM_TYPE == 0
    disp('Load liblinear-dense-float');
    addpath('../liblinear-1.5-dense-float/matlab');
elseif SVM_TYPE == 1
    disp('Load liblinear-1.91 Original');
    addpath('../liblinear-1.91-original/matlab');
elseif SVM_TYPE == 2
    disp('Load libsvm-3.12 Original');
    addpath('../libsvm-3.12-original/matlab');
end

% initialize the parameters of kdes
kdes_params.grid = 8;   % kdes is extracted every 8 pixels
kdes_params.patchsize = 16;  % patch size
emk_params.pyramid = [1 2 3];
emk_params.ktype = 'rbf';
emk_params.kparam = 0.01;

if 0
    path = 'rgbdfea_depth_gradkdes';
    load('gradkdes_dep_params');
    kdes_params.kdes = gradkdes_dep_params;
end
if 1
    path = 'rgbdfea_pcloud_normalkdes';
    load('normalkdes_params');
    kdes_params.kdes = normalkdes_params;
end
if 0
    path = 'rgbdfea_rgb_gradkdes';
    load('gradkdes_params');
    kdes_params.kdes = gradkdes_params;
end
if 0
    path = 'rgbfea_rgb_rgbkdes';
    load('rgbkdes_params');
    kdes_params.kdes = rgbkdes_params;
end

load(path);


category = 1;
if category
trail = 1;
   for i = 1:trail
       % generate training and test samples
       ttrainindex = [];
       ttestindex = [];
       labelnum = unique(rgbdclabel);
       for j = 1:length(labelnum)
           trainindex = find(rgbdclabel == labelnum(j));
           rgbdilabel_unique = unique(rgbdilabel(trainindex));
           perm = randperm(length(rgbdilabel_unique));
           subindex = find(rgbdilabel(trainindex) == rgbdilabel_unique(perm(1)));
           testindex = trainindex(subindex);
           %trainindex(subindex) = [];
           ttrainindex = [ttrainindex trainindex];
           ttestindex = [ttestindex testindex];
       end
       %load rgbdfea_depth_gradkdes;
       load(path);
       trainhmp = rgbdfea(:,ttrainindex);
       clear rgbdfea;
       
       if SVM_TYPE ~= 0
           trainhmp = double( trainhmp );
           trainhmp = sparse( trainhmp );%For original libsvm and liblinear
       end
       
       [trainhmp, minvalue, maxvalue] = scaletrain(trainhmp, 'linear');
       trainlabel = rgbdclabel(ttrainindex); % take category label

       % classify with liblinear
       if SVM_TYPE == 2
           lc = 0.3;
           option = ['-s 0 -t 0 -b 1 -c ' num2str(lc)];
           model = svmtrain(trainlabel', trainhmp', option);
       else
           %% Cross Validation %%
           %cross_validation;
           %option = ['-s 1 -c ' num2str(bestc)];
           %model = train(trainlabel', trainhmp', option);
               
           lc = 0.3;
           %{
           k = (1+log( length(trainhmp(1,:)) )/log(2))*4;
           k = floor(k);
           disp( ['Cross Validation`s Param k is ' num2str(k)] );
           option = ['-s 1 -v ' num2str(k) ' -c ' num2str(lc)];
           cv = train(trainlabel',trainhmp',option);
           %}
           option = ['-s 1 -c ' num2str(lc)];
           model = train(trainlabel',trainhmp',option);
       end
       
       %load rgbdfea_depth_gradkdes;
       load(path);
       testhmp = rgbdfea(:,ttestindex);
       clear rgbdfea;
       
       if SVM_TYPE ~= 0
           testhmp = double( testhmp );
           testhmp = sparse( testhmp );%For libsvm and liblinear
       end
       
       testhmp = scaletest(testhmp, 'linear', minvalue, maxvalue);
       testlabel = rgbdclabel(ttestindex); % take category label
       if SVM_TYPE == 2
           [predictlabel, accuracy, decvalues] = svmpredict(testlabel', testhmp', model);
       else
           [predictlabel, accuracy, decvalues] = predict(testlabel', testhmp', model);
       end
       acc_c(i,1) = mean(predictlabel == testlabel');
       %save('./results/depth_gradkdes_acc_c.mat', 'acc_c', 'predictlabel', 'testlabel', 'decvalues');

       % print and save results
       disp(['Accuracy of Liblinear is ' num2str(mean(acc_c))]);
   end
end