% Remaked by Hideshi Tsubota 2012/07/22 @DHRC
%

% Please choice only one path about SVM Library.
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

addpath('../helpfun');
addpath('../kdes');
addpath('../emk');
addpath('../myfun');

% combine all kernel descriptors
rgbdfea_joint = [];

tPath = [];
tPath = [ imdir 'rgbdfea_rgb_gradkdes.mat' ];
load(tPath);
rgbdfea_joint = [rgbdfea_joint; rgbdfea];
disp( ['loading...  ' tPath] ); 

%load rgbdfea_rgb_lbpkdes.mat;
%rgbdfea_joint = [rgbdfea_joint; rgbdfea];

tPath = [];
tPath = [ imdir 'rgbdfea_rgb_rgbkdes.mat' ];
load(tPath);
rgbdfea_joint = [rgbdfea_joint; rgbdfea];
disp( ['loading...  ' tPath] ); 

tPath = [];
tPath = [ imdir 'rgbdfea_depth_gradkdes.mat' ];
load(tPath);
rgbdfea_joint = [rgbdfea_joint; rgbdfea];
disp( ['loading...  ' tPath] ); 

%load rgbdfea_depth_lbpkdes.mat;
%rgbdfea_joint = [rgbdfea_joint; rgbdfea];

tPath = [];
tPath = [ imdir 'rgbdfea_pcloud_normalkdes.mat' ];
load(tPath);
rgbdfea_joint = [rgbdfea_joint; rgbdfea];
disp( ['loading...  ' tPath] ); 

%load rgbdfea_pcloud_sizekdes.mat;
%rgbdfea_joint = [rgbdfea_joint; rgbdfea];

[tmp, minvalue, maxvalue] = scaletrain(rgbdfea, 'linear');
save -v7.3 rgbdfea_joint rgbdfea rgbdclabel rgbdilabel rgbdvlabel rgbdwords G rgbdwords kdes_params emk_params minvalue maxvalue;

category = 0;
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
           %trainindex(subindex) = [];%debug
           ttrainindex = [ttrainindex trainindex];
           ttestindex = [ttestindex testindex];
       end
       load rgbdfea_joint;
       trainfea = rgbdfea_joint(:,ttrainindex);
       clear rgbdfea_joint;
	   
       [trainfea, minvalue, maxvalue] = scaletrain(trainfea, 'linear'); 
       trainlabel = rgbdclabel(ttrainindex); % take category label
       
	   if SVM_TYPE ~= 0
           trainfea = double( trainfea );
           trainfea = sparse( trainfea );%For libsvm and liblinear
       end
       
       % classify with liblinear
       if SVM_TYPE == 2
           lc = 0.3;
           option = ['-s 0 -t 0 -b 1 -c ' num2str(lc)];
           model = svmtrain(trainlabel', trainfea', option);
       else
           if 1
            bestcv = 0;
            bestc = 0;
            for log2c = -1:2:3
                    cmd = ['-s 1 -v 2 -c ', num2str(2^log2c) ];
                    cv = train(trainlabel', trainfea', cmd);
                    if (cv >= bestcv),
                        bestcv = cv; bestc = 2^log2c;
                    end
                    fprintf('%g %g (best c=%g, rate=%g)\n', log2c, cv, bestc, bestcv);
            end
            option = ['-s 1 -c ' num2str(bestc) ];
            model = train(trainlabel', trainfea', option);
            fprintf('%g %g (best c=%g, rate=%g)\n', log2c, cv, bestc, bestcv);
           else
            lc = 0.3;
            option = ['-s 1 -c ' num2str(lc)];
            model = train(trainlabel',trainfea',option);
           end
       end
       
   end
end

