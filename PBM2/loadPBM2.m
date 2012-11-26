%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ partmodel ] = loadPBM2( varargin )
%% Load Part-Based Model
%% e.g. [ partmodel{1} ] = loadPBM2( 'full', 'rgbdrgbgkdes', 'rgbdgkdes' );

%% KDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rgbd + ''input data( rgb, dep...)'' + ''kdes name'' + kdes
% rgbdrgbrgbrgbkdes, rgbdrgbgkdes, rgbddepgkdes, rgbdpcloudspinkdes
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global path;
path = '../Evaluate/Model/';

part = varargin{1};% full, left, right, down or top
for i = 2:nargin
    kdes{i-1} = varargin{i};
    [ partmodel{i-1} ] = loadModel( part, kdes{i-1} );
    partmodel{i-1}.part = part;
    %{
    if nargin > 2 && i == nargin-1
        break;
    end
    %}
end

if nargin ~= 2 && nargin ~= 1
    kdes{nargin} = 'combinekdes';
    %partmodel{nargin+1} = loadModel( part, kdes{nargin} );
    partmodel{nargin}.part = part;
end

%kdesnum = length(kdes);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ model ] = loadModel( part, type )

switch type
    
    case 'rgbdrgbrgbkdes'
        name = 'modelrgbkdes.mat';
        tmp = loadFeature( part, name );
        load(tmp);
        model.kdes = modelrgbkdes.kdes;
        model.emk = modelrgbkdes.emk;
        model.svm = modelrgbkdes.svm;
        model.matlab = modelrgbkdes.matlab;
        model.inputdata = 'rgb';
    case 'rgbdrgbgkdes'
        name = 'modelgkdes.mat';
        tmp = loadFeature( part, name );
        load(tmp);
        model.kdes = modelgkdes.kdes;
        model.emk = modelgkdes.emk;
        model.svm = modelgkdes.svm;
        model.matlab = modelgkdes.matlab;
        model.inputdata = 'rgb';
    case 'rgbddepgkdes'
        name = 'modelgkdes_dep.mat';
        tmp = loadFeature( part, name );
        load(tmp);
        model.kdes = modelgkdes.kdes;
        model.emk = modelgkdes.emk;
        model.svm = modelgkdes.svm;
        model.matlab = modelgkdes.matlab;
        model.inputdata = 'dep';
    case 'rgbdpcloudspinkdes'
        name = 'modelspinkdes.mat';
        tmp = loadFeature( part, name );
        load(tmp);
        model.kdes = modelspinkdes.kdes;
        model.emk = modelspinkdes.emk;
        model.svm = modelspinkdes.svm;
        model.matlab = modelspinkdes.matlab;
        model.inputdata = 'dep';
    case 'combinekdes';
        name = 'combinekdes.mat';
        tmp = loadFeature( part, name );
        load(tmp);
        model.matlab = modelgkdes.matlab;
        model.inputdata = 'combine';
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ tmp ] = loadFeature( part, name )
global path;

tmp = [];
switch part
    case 'full'
        tmp = [ path 'full/' name ];
    case 'left'
        tmp = [ path 'left/' name ];
    case 'right'
        tmp = [ path 'right/' name ];
    case 'top'
        tmp = [ path 'top/' name ];
    case 'bottom'
        tmp = [ path 'bottom/' name ];
end