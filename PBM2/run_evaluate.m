for loop = 1:5
    rootname = 'evaluate_'; 
    extension = '.mat';

    dir{1} = '../images/Model_Test/left/';
    dir{2} = '../images/Model_Test/right/';
    dir{3} = '../images/Model_Test/top/';
    dir{4} = '../images/Model_Test/bottom/';
    dir{5} = '../images/Model_Test/full/';
    imdir = dir{loop};
    load PBM.mat;
    
    evaluate;
    
    filename = [rootname, num2str(loop), extension];
    eval(['save ', filename]);
    
    clear;
end