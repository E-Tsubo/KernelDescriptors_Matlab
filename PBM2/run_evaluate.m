for loop = 1:5
    rootname = 'evaluate_'; 
    extension = '.mat';

    dir{1} = '../images/rgbdsubset/rgbdsubset_left/';
    dir{2} = '../images/rgbdsubset/rgbdsubset_right/';
    dir{3} = '../images/rgbdsubset/rgbdsubset_top/';
    dir{4} = '../images/rgbdsubset/rgbdsubset_bottom/';
    dir{5} = '../images/rgbdsubset/rgbdsubset_full/';
    imdir = dir{loop};
    
    %% Part-based Model
    load PBM.mat;
    evaluate;
    
    %% Normal Detector
    %load '../Evaluate/Model/full/modelspinkdes.mat'
    %testOtherSamples;
    
    filename = [rootname, num2str(loop), extension];
    eval(['save ', filename]);
    
    clear;
    pause(1);
end