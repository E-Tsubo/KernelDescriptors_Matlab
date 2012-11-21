% load train features
path = '../Evaluate/Model/';

%% DEPTH-GRADIENT
if 0
    name = 'rgbdfea_depth_gradkdes.mat'; 
end
if 0
    name = 'rgbdfea_pcloud_normalkdes.mat';
end
if 1
    name = 'rgbdfea_rgb_gradkdes.mat';
end
if 0
    name = 'rgbfea_rgb_rgbkdes.mat';
end
  
fullpath = [ path 'Full/' name ];
leftpath = [ path 'Left/' name ];
rightpath = [ path 'Right/' name ];
toppath = [ path 'Top/' name ];
bottompath = [ path 'Bottom/' name ];
    
trainfea{1} = load(fullpath);
trainfea{2} = load(leftpath);
trainfea{3} = load(rightpath);
trainfea{4} = load(toppath);
trainfea{5} = load(bottompath);
    
clear name fullpath leftpath rightpath toppath bottompath;