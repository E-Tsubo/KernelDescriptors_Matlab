%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2012/10/17 Written by Hideshi T. @DHRC
% Get RGB and DEPTH image via Kinect and Run KernelDescriptors Object
% Recognition System.
%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialise
%close all; clear all;

%% Process Program
addpath('../../KinectHandler_Matlab/MexOpenNI');
addpath('../../KinectHandler_Matlab/MexFunc');

%% Load Model Data and process.m
% FULL, LEFT, RIGHT, TOP, BOTTOM
USE_PART_MODEL = 4;

%% Create context with xml file
context = mxNiCreateContext('../../KinectHandler_Matlab/Config/SamplesConfig.xml');

%% Initialise FIGURE
width = 640; height = 480;

%% Initialise Crop Region
CROP_FLAG = 1;
crop_w = 50; crop_h = 100;
center_w = 320; center_h = 240;

%% Initialise Data Structure Field
% depth image
figure, h1 = imagesc(zeros(height,width,'uint16'));
% rgb image
figure, h2 = imagesc(zeros(height,width,3,'uint8'));
%  rgb+depth image
figure, h3 = imagesc(zeros(height,width,3,'uint8')); hold on;
        h4 = imagesc(zeros(height,width,'uint16'));  hold off;
        
%% LOOP
loopcnt = 1;
SELF_CROP_FLAG = 0;
while 1
%for l = 1:1

    tic
    %align Depth onto RGB
    option.adjust_view_point = true;
    % Acquire RGB and Depth image
    mxNiUpdateContext(context, option);
    [rgb, depth] = mxNiImage(context);
    % Update figure 
    set(h1,'CData',depth); 
    set(h2,'CData',rgb); 
    set(h3,'CData',rgb); 
    set(h4,'CData',depth);
    set(h4,'AlphaData',double(depth/50));
    
    % Set crop region
    if CROP_FLAG
        if SELF_CROP_FLAG == 0
            crop_rgb = rgb(center_h-crop_h/2:center_h+crop_h/2, center_w-crop_w/2:center_w+crop_w/2, :);
            crop_depth = depth(center_h-crop_h/2:center_h+crop_h/2, center_w-crop_w/2:center_w+crop_w/2, :);
        end
        
        for i = 1:USE_PART_MODEL
    
            [tmp_dec, tmp_label, tmp_features, tmp_name] = process_PartBasedModel2( PBM.partdetector, i, crop_rgb, crop_depth );
    
            part_decvalues{i} = tmp_dec;
            part_label{i} = tmp_label;
        end

        [ final_dec, final_label ] = combineModel( part_decvalues, part_label, PBM.combinedetector.svm, PBM.combinedetector.minvalue, PBM.combinedetector.maxvalue ); 

        disp( ' ' );
        disp( [ 'Detected Object is ' tmp_name{final_label} ] );
        disp( final_dec );
        Xlabel( [ tmp_name{final_label} '  ' num2str(final_dec(final_label)) ] );
                
        if SELF_CROP_FLAG == 0
            rectangle( 'Position', [ center_w-crop_w/2, center_h-crop_h/2, crop_w, crop_h ] );
        else
            rectangle( 'Position', [ rect(1), rect(2), rect(3), rect(4) ] );
        end
    end
    
    drawnow;
    disp(['itr=' sprintf('%d',loopcnt) , ' : FPS=' sprintf('%f',1/toc)]);
    loopcnt = loopcnt + 1;
    
    if GetAsyncKeyState(char(27))%esc
        break;
    elseif GetAsyncKeyState(char(83))%s
        [crop_rgb, rect] = imcrop(rgb);
        crop_depth = depth( rect(2):rect(2)+rect(4), rect(1):rect(1)+rect(3), : );
        SELF_CROP_FLAG = 1;
        figure, h2 = imagesc(zeros(height,width,3,'uint8'));
   elseif GetAsyncKeyState(char(68))%d
       disp('Delete Crop Image'); 
       SELF_CROP_FLAG = 0;
   end
    
end

%% Delete the context object
mxNiDeleteContext(context);
disp('Release Kinect');