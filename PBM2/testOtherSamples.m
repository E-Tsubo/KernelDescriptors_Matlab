%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath('../helpfun');
addpath('../kdes');
addpath('../emk');
addpath('../myfun');
%addpath('../demo_rgbd/predictProcess');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
addpath('../CVonMatlabFunc');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp( imdir );

imsubdir = dir_bo(imdir);
impath = [];
rgbdclabel = [];
rgbdilabel = [];
rgbdvlabel = [];
subsample = 15;
disp(['subsample is ' num2str(subsample)]);
label_num = 0;

wait_h = waitbar( 0, 'Recognition Test...');
set( wait_h, 'Name', 'Part-based Model Progress' );

other = 0;
if other
for i = 1:length(imsubdir)
    [rgbdilabel_tmp, impath_tmp] = get_im_label([imdir imsubdir(i).name '/'], '_crop.png');
    for j = 1:length(impath_tmp)
        ind = find(impath_tmp{j} == '_');
        rgbdvlabel_tmp(1,j) = str2num(impath_tmp{j}(ind(end-2)+1));
    end

    it = 0;
    for j = 1:1:length(impath_tmp)
        if mod(j-1, subsample) == 0
            continue;
        end
        it = it + 1;
        impath_tmp_sub{it} = impath_tmp{j};
        rgbdvlabel_tmp2(1,it) = rgbdvlabel_tmp(1,j);
        rgbdilabel_tmp2(1,it) = rgbdilabel_tmp(1,j);
    end
    impath = [impath impath_tmp_sub];
    rgbdclabel = [rgbdclabel i*ones(1,length(impath_tmp_sub))];
    rgbdilabel = [rgbdilabel rgbdilabel_tmp2(1:1:end)+label_num];
    rgbdvlabel = [rgbdvlabel rgbdvlabel_tmp2(1:1:end)];
    label_num = label_num + length(unique(rgbdilabel_tmp2));
    clear impath_tmp_sub rgbdvlabel_tmp;
    clear rgbdvlabel_tmp2 rgbdilabel_tmp2 rgbdvlabel_tmp rgbdilabel_tmp;
end
end

same = 1;
if same
for i = 1:length(imsubdir)
    [rgbdilabel_tmp, impath_tmp] = get_im_label([imdir imsubdir(i).name '/'], '_depthcrop.png');
    for j = 1:length(impath_tmp)
        ind = find(impath_tmp{j} == '_');
        rgbdvlabel_tmp(1,j) = str2num(impath_tmp{j}(ind(end-2)+1));
    end

    it = 0;
    for j = 1:subsample:length(impath_tmp)
        it = it + 1;
        impath_tmp_sub{it} = impath_tmp{j};
    end
    impath = [impath impath_tmp_sub];
    rgbdclabel = [rgbdclabel i*ones(1,length(impath_tmp_sub))];
    rgbdilabel = [rgbdilabel rgbdilabel_tmp(1:subsample:end)+label_num];
    rgbdvlabel = [rgbdvlabel rgbdvlabel_tmp(1:subsample:end)];
    label_num = label_num + length(unique(rgbdilabel_tmp));
    clear impath_tmp_sub rgbdvlabel_tmp;
end
end

cnt_correct = 0;
cnt_wrong = 0;
for i = 1:length(impath)
    disp( ['Image No.' num2str(i) ' ClassLabel:' num2str(rgbdclabel(1,i)) ' ' impath{i}] );
    rgb = imread([ impath{i}(1:end-13) 'crop.png' ]);
    dep = imread([impath{i}(1:end-13) 'depthcrop.png']);
    loc = fliplr(load([impath{i}(1:end-13) 'loc.txt']));
    
    %For occlusion experiment
    rgb = rgb( :, 1:(size(rgb,2)-1*size(rgb,2)/4), :);
    dep = dep( :, 1:(size(dep,2)-1*size(dep,2)/4), :);
    loc(1) = loc(1) - 1*size(rgb,2)/4;
    
    %% Process 
    [dec, lab, features, name] = process( 'com', rgb, dep, loc, modelgkdes, modelrgbkdes, modelgkdes_dep, modelspinkdes, combinekdes  );
    %[dec, lab, features, name] = process( 'dep', dep, loc, modelspinkdes );
    
    store_name{i,1} = i;
    store_name{i,2} = rgbdclabel(1,i);
    store_name{i,3} = impath{i};
    store_fd{i} = dec{1};
    store_fl(i) = lab{1};
    
    if lab{1} == rgbdclabel(1,i)
        cnt_correct = cnt_correct + 1;
        disp('###############Correct###############');
    else
        cnt_wrong = cnt_wrong + 1;
        disp('Not Correct');
    end
    %%    
    waitbar( i/length(impath) );
end

close(wait_h);