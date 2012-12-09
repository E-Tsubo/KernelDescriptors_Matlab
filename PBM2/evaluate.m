%% 2012/11/27 Written by Hidesh T.
%% Evaluate Program
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SVM_TYPE = 2;
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
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% FULL, LEFT, RIGHT, TOP, BOTTOM
USE_PART_MODEL = 5;

%imdir = '../images/Model/left/';
disp( imdir );

imsubdir = dir_bo(imdir);
impath = [];
rgbdclabel = [];
rgbdilabel = [];
rgbdvlabel = [];
subsample = 40;
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
    [rgbdilabel_tmp, impath_tmp] = get_im_label([imdir imsubdir(i).name '/'], '_crop.png');
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

FLAG_PBM = 1;
cnt_correct = 0;
cnt_wrong = 0;
for i = 1:length(impath)
    disp( ['Image No.' num2str(i) ' ClassLabel:' num2str(rgbdclabel(1,i)) ' ' impath{i}] );
    rgb = imread( impath{i} );
    dep = imread([impath{i}(1:end-8) 'depthcrop.png']);
    loc = fliplr(load([impath{i}(1:end-8) 'loc.txt']));
    
    
    
    %% Part-based ModelProcess 
    if FLAG_PBM == 1
    for j = 1:USE_PART_MODEL
    
        [tmp_dec, tmp_label, tmp_features, tmp_name] = process_PartBasedModel2( PBM.partdetector, j, rgb, dep, loc );
    
        part_decvalues{j} = tmp_dec;
        part_label{j} = tmp_label;
    end
    
    [ final_dec, final_label ] = combineModel( part_decvalues, part_label, PBM.combinedetector.svm, PBM.combinedetector.minvalue, PBM.combinedetector.maxvalue );

    disp( ' ' );
    disp( [ 'Detected Object is ' tmp_name{final_label} ] );
    disp( final_dec );
    
    else        
        [dec, lab, features, name] = process( 'rgb', rgb, modelgkdes );
        final_dec = dec;
        final_label = lab;
    end
    
    store_name{i,1} = i; 
    store_name{i,2} = rgbdclabel(1,i); 
    store_name{i,3} = impath{i};
    store_fd{i} = final_dec;
    store_fl(i) = final_label;
    
    if final_label == rgbdclabel(1,i)
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