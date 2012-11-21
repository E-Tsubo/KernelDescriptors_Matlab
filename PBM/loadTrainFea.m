% load train features
%path = '../Evaluate/Model/';

%% 
if DEP_GRAD
    name = 'rgbdfea_depth_gradkdes.mat'; 
end
if DEP_SPIN
    name = 'rgbdfea_pcloud_normalkdes.mat';
end
if RGB_GRAD
    name = 'rgbdfea_rgb_gradkdes.mat';
end
if RGB_RGB
    name = 'rgbdfea_rgb_rgbkdes.mat';
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