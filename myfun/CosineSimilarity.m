function [DCOS] = scaletrain(fea)
% 2012/09/24 Written by Hideshi Tsubota @DHRC
% �R�T�C���ގ��x
% �X�P�[���������K�v��?

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