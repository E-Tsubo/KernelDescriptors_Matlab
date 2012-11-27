rootname = 'evaluate_'; 
extension = '.mat';

dir{1} = '../images/Model/full/';
dir{2} = '../images/Model/right/';
dir{3} = '../images/Model/top/';
dir{4} = '../images/Model/bottom/';
%dir{5} = '../images/Model/full/';


for loop = 1:length(dir)
    
    imdir = dir{loop};
    load PBM.mat;
    
    evaluate;
    
    filename = [rootname, num2str(loop), extension];
    eval(['save ', filename]);
    
    clear;
end