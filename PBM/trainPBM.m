%% Part-Based SVM (Combine SVM) Train Program
%% 2012/11/20 Written by Hideshi T.

%% please use loadPBM in order to prepare part-svm.
% FULL, LEFT, RIGHT, TOP, BOTTOM
USE_PART_MODEL = 5;
partmodel{1} = full;
partmodel{2} = left;
partmodel{3} = right;
partmodel{4} = top;
partmodel{5} = bottom;
%clear full left right top bottom;

%% load train features
loadTrainFea;

%% Collecting Part Component Score (decision value)
addpath('../liblinear-1.91-original/matlab');
%addpath('../liblinear-1.5-dense-float/matlab');

addpath('../helpfun');
addpath('../kdes');
addpath('../emk');
addpath('../myfun');

if 1
for i = 1:USE_PART_MODEL
    disp( [ 'Part is ' num2str(i) ] );
    
    tmp_model = partmodel{i}.matlab.model;
    tmp_min = partmodel{i}.svm.minvalue;
    tmp_max = partmodel{i}.svm.maxvalue;
    
    for j = 1:USE_PART_MODEL
        disp( [ 'predict part is ' num2str(j) ] );
        tmp_fea = trainfea{j}.rgbdfea;
        tmp_label = trainfea{j}.rgbdclabel;
    
        tmp_fea = double( tmp_fea );
        tmp_fea = sparse( tmp_fea );
        tmp_fea = scaletest( tmp_fea, 'linear', tmp_min, tmp_max );
        [ predictlabel{i,j}, accuracy{i,j}, decvalues{i,j} ] = predict( tmp_label', tmp_fea', tmp_model );
    end
    
end
end


%% Training Combine SVM from Part Component Score

% arrange training set from part-component score
% decvalues{1,2}(1,2) 
%decvalues{partmodel indx, parttrainfea idx}(trainidx,label)

combinelabel = [];
combinefea   = [];

%{
%必要デバッグ
for h = 1:USE_PART_MODEL %Part-Model Index
    cnt = 1;
    for i = 1:USE_PART_MODEL %Part-Train Feature Index
        for j = 1:length(trainfea{i}.rgbdclabel) % Train Fea Instance Index
            cidx = trainfea{i}.rgbdclabel(j);
            combinefea( cnt, h ) = decvalues{h,i}(j,cidx);
            combinelabel( cnt ) = cidx;
            cnt = cnt + 1;
        end
    end
end
%}

for h = 1:USE_PART_MODEL %Part-Model Index
    cnt = 1;
    for i = 1:USE_PART_MODEL %Part-Train Feature Index
        for j = 1:length(trainfea{i}.rgbdclabel) %Train Fea Instance Index
            for k = 1:partmodel{1}.svm.nr_class %Class Index
                cidx = trainfea{i}.rgbdclabel(j);
                combinefea( cnt, (k-1)*USE_PART_MODEL + h ) = decvalues{h, i}(j, k);
                combinelabel( cnt ) = cidx;
            end
            cnt = cnt + 1;
        end
    end
end

disp( ' Learning... ' );
%[combinefea, minvalue, maxvalue] = scaletrain(combinefea', 'linear');
combinefea = combinefea';
combinefea = sparse( combinefea );

lc = 0.3;
option = ['-s 1 -c ' num2str(lc)];
combinemodel = train(combinelabel', combinefea', option);



