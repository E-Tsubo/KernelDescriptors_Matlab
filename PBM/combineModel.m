%% 2012/11/19 Written by Hideshi T. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ finaldec, finallabel ] = combineModel( dec, lab, model, minvalue, maxvalue )
%% Combine Function using Part-Based SVM Model
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%memo dec{1}{1}(1); access dec{part_num}{win_num}(label_num)
part_num = length(dec);
win_num  = length(dec{1});
lab_num  = length(dec{1}{1});

%% Init
for i = 1:win_num
    for j = 1:lab_num
        finaldec(i, j) = 0;
    end
end

method = 2;
switch( method )
    
    %% Simplest Method: Linear Sum Score
    case 1
        
        for i = 1:win_num
           for j = 1:part_num
               for k = 1:lab_num
                    finaldec(i, k) = finaldec(i, k) + dec{j}{i}(k);
               end
           end
           
           [ value(i) idx(i) ] = max( finaldec(i,:) );
        end
        
        
        finallabel = idx;
        
    %% Combine SVM Score
    case 2
        
        for i = 1:lab_num
            for j = 1:part_num
                fea(1, (i-1)*part_num + j) = dec{j}{1}(i);
            end
            testlabel( 1, 1 ) = -1;
        end
        
        fea = sparse(fea);
        fea = scaletest(fea', 'linear', minvalue, maxvalue);
        [finallabel, finalaccuracy, finaldec] = predict(testlabel, fea', model);
end