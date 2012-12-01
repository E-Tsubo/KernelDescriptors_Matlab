for loop = 1:5
    rootname = 'evaluate_'; 
    extension = '.mat';

    dir{1} = '../images/Model_Test/left/';
    dir{2} = '../images/Model_Test/right/';
    dir{3} = '../images/Model_Test/top/';
    dir{4} = '../images/Model_Test/bottom/';
    dir{5} = '../images/Model_Test/full/';
    imdir = dir{loop};
    
    %% Part-based Model
    %load PBM.mat;
    %evaluate;
    
    %% Normal Detector
    load '../Evaluate/Model/full/modelspinkdes.mat'
    testOtherSamples;
    
    filename = [rootname, num2str(loop), extension];
    eval(['save ', filename]);
    
    clear;
    pause(1);
end