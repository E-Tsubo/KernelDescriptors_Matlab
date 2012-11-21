%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2012/11/19 Written by Hideshi T.
%% Part-Based Model Program
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%please load input image as rgb or dep variance and part-model.
%e.g. rgb = imread('input.png');
%about part-based model, change the name follows
%Model Name:full, left, right, top, bottom.

% FULL, LEFT, RIGHT, TOP, BOTTOM
USE_PART_MODEL = 5;
model{1} = full;
model{2} = left;
model{3} = right;
model{4} = top;
model{5} = bottom;

%% Only one feature. All part Model is maked by same feature.
for i = 1:USE_PART_MODEL
    disp('  ');
    
    [dec, lab, features, name] = process_PartBasedModel( 'rgb', rgb, model{i} );

    decvalue{i} = dec;
    label{i} = lab;
end

[ finaldec, finallab ] = combineModel( decvalue, label, combinemodel );

%% To evaluate
%access dec{part_num}{win_num}(label_num)
