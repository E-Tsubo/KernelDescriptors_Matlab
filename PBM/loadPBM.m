%%Load Part-Based Model
path = '../Evaluate/Model/';

%% DEPTH-GRADIENT
if 0
    name = 'modelgkdes_dep.mat';
    fullpath = [ path 'Full/' name ];
    leftpath = [ path 'Left/' name ];
    rightpath = [ path 'Right/' name ];
    toppath = [ path 'Top/' name ];
    bottompath = [ path 'Bottom/' name ];
    
    load(fullpath);
    full.kdes = modelgkdes.kdes;
    full.emk = modelgkdes.emk;
    full.svm = modelgkdes.svm;
    full.matlab = modelgkdes.matlab;
    
    load(leftpath);
    left.kdes = modelgkdes.kdes;
    left.emk = modelgkdes.emk;
    left.svm = modelgkdes.svm;
    left.matlab = modelgkdes.matlab;
    
    load(rightpath);
    right.kdes = modelgkdes.kdes;
    right.emk = modelgkdes.emk;
    right.svm = modelgkdes.svm;
    right.matlab = modelgkdes.matlab;
    
    load(toppath);
    top.kdes = modelgkdes.kdes;
    top.emk = modelgkdes.emk;
    top.svm = modelgkdes.svm;
    top.matlab = modelgkdes.matlab;
    
    load(bottompath);
    bottom.kdes = modelgkdes.kdes;
    bottom.emk = modelgkdes.emk;
    bottom.svm = modelgkdes.svm;
    bottom.matlab = modelgkdes.matlab;
    
    clear fullpath leftpath rightpath toppath bottompath path name modelgkdes;
end

%% DEPTH-SPINIMAGE
if 0
    name = 'modelspinkdes.mat';
    fullpath = [ path 'Full/' name ];
    leftpath = [ path 'Left/' name ];
    rightpath = [ path 'Right/' name ];
    toppath = [ path 'Top/' name ];
    bottompath = [ path 'Bottom/' name ];
    
    load(fullpath);
    full.kdes = modelspinkdes.kdes;
    full.emk = modelspinkdes.emk;
    full.svm = modelspinkdes.svm;
    full.matlab = modelspinkdes.matlab;
    
    load(leftpath);
    left.kdes = modelspinkdes.kdes;
    left.emk = modelspinkdes.emk;
    left.svm = modelspinkdes.svm;
    left.matlab = modelspinkdes.matlab;
    
    load(rightpath);
    right.kdes = modelspinkdes.kdes;
    right.emk = modelspinkdes.emk;
    right.svm = modelspinkdes.svm;
    right.matlab = modelspinkdes.matlab;
    
    load(toppath);
    top.kdes = modelspinkdes.kdes;
    top.emk = modelspinkdes.emk;
    top.svm = modelspinkdes.svm;
    top.matlab = modelspinkdes.matlab;
    
    load(bottompath);
    bottom.kdes = modelspinkdes.kdes;
    bottom.emk = modelspinkdes.emk;
    bottom.svm = modelspinkdes.svm;
    bottom.matlab = modelspinkdes.matlab;
    
    clear fullpath leftpath rightpath toppath bottompath path name modelspinkdes;
end

%% RGB=GRADIENT
if 1
   name = 'modelgkdes.mat';
    fullpath = [ path 'Full/' name ];
    leftpath = [ path 'Left/' name ];
    rightpath = [ path 'Right/' name ];
    toppath = [ path 'Top/' name ];
    bottompath = [ path 'Bottom/' name ];
    
    load(fullpath);
    full.kdes = modelgkdes.kdes;
    full.emk = modelgkdes.emk;
    full.svm = modelgkdes.svm;
    full.matlab = modelgkdes.matlab;
    
    load(leftpath);
    left.kdes = modelgkdes.kdes;
    left.emk = modelgkdes.emk;
    left.svm = modelgkdes.svm;
    left.matlab = modelgkdes.matlab;
    
    load(rightpath);
    right.kdes = modelgkdes.kdes;
    right.emk = modelgkdes.emk;
    right.svm = modelgkdes.svm;
    right.matlab = modelgkdes.matlab;
    
    load(toppath);
    top.kdes = modelgkdes.kdes;
    top.emk = modelgkdes.emk;
    top.svm = modelgkdes.svm;
    top.matlab = modelgkdes.matlab;
    
    load(bottompath);
    bottom.kdes = modelgkdes.kdes;
    bottom.emk = modelgkdes.emk;
    bottom.svm = modelgkdes.svm;
    bottom.matlab = modelgkdes.matlab;
    
    clear fullpath leftpath rightpath toppath bottompath path name modelgkdes;
end

%% RGB-RGBCOLOR
if 0
    name = 'modelrgbkdes.mat';
    fullpath = [ path 'Full/' name ];
    leftpath = [ path 'Left/' name ];
    rightpath = [ path 'Right/' name ];
    toppath = [ path 'Top/' name ];
    bottompath = [ path 'Bottom/' name ];
    
    load(fullpath);
    full.kdes = modelrgbkdes.kdes;
    full.emk = modelrgbkdes.emk;
    full.svm = modelrgbkdes.svm;
    full.matlab = modelrgbkdes.matlab;
    
    load(leftpath);
    left.kdes = modelrgbkdes.kdes;
    left.emk = modelrgbkdes.emk;
    left.svm = modelrgbkdes.svm;
    left.matlab = modelrgbkdes.matlab;
    
    load(rightpath);
    right.kdes = modelrgbkdes.kdes;
    right.emk = modelrgbkdes.emk;
    right.svm = modelrgbkdes.svm;
    right.matlab = modelrgbkdes.matlab;
    
    load(toppath);
    top.kdes = modelrgbkdes.kdes;
    top.emk = modelrgbkdes.emk;
    top.svm = modelrgbkdes.svm;
    top.matlab = modelrgbkdes.matlab;
    
    load(bottompath);
    bottom.kdes = modelrgbkdes.kdes;
    bottom.emk = modelrgbkdes.emk;
    bottom.svm = modelrgbkdes.svm;
    bottom.matlab = modelrgbkdes.matlab;
    
    clear fullpath leftpath rightpath toppath bottompath path name modelrgbkdes;
end;