function [DCOS] = scaletrain(fea)
% 2012/09/24 Written by Hideshi Tsubota @DHRC
% コサイン類似度
% スケール調整が必要か?

nr_train = length(rgbdfea);
disp(nr_train/2);
DCOS = [];
fea=double(rgbdfea);
for i = 1:nr_train
    X = norm( fea(:,i) );
    for j = i+1:nr_train
        Y = norm( fea(:,j) );
        dotXY = dot( X, Y );
        DCOS( i, j ) = dotXY / ( X * Y );
    end
    disp( i );
end