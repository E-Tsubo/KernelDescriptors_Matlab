% 2012/09/20 Written by Hideshi Tsubota @HDRC

% At first please type load rgbdfea_**_**
% This program uses rgbdclabel, rgbdilabel and rgbdfea data.

% Store Field
% I want to use eval function. However this matlab(2009) doen`t support.
n = length(rgbdclabel);%Total Number of input data
c = max(rgbdclabel);%The Number of class
for i = 1:c
    str = ['class' num2str(i)];
    store_fea.(str) = 1;
end

% To store data per class.
start_ind = 1;
store_ind(1,1) = start_ind;
for i = 1:c-1
    for j = start_ind:n
        if rgbdclabel(1,j) ~= i
            %disp(j);
            start_ind = j;
            store_ind(i,2) = j-1;
            store_ind(i+1,1) = start_ind;
            break;
        end
    end
end
store_ind(c,2) = n;

% Create feature data per class
for i = 1:c
    tmp_fea = rgbdfea(:, store_ind(i,1):store_ind(i,2));
    store_fea.(['class' num2str(i)]) = tmp_fea;
    %store_fea(i) = tmp_fea;
    clear tmp_fea;
end

% Within-class variance クラス内分散
% クラス毎の分散
for i = 1:c
    % Ave vector in one class
    fea = store_fea.(['class' num2str(i)]);
    m = mean( fea, 2 );% 行ごとの平均 クラスの平均ベクトル
    ave_class(:,i) = m;
    
    vw(i,1) = 0;
    for j = 1:(store_ind(i,2)-store_ind(i,1)+1)
        vw(i,1) = vw(i,1) + ( fea(:,j) - m )' * ( fea(:,j) - m );
    end
    d_per_class(i,1) = vw(i,1) / (store_ind(i,2)-store_ind(i,1));
    disp( ['各クラス毎の分散:' num2str(vw(i,1)/(store_ind(i,2)-store_ind(i,1)+1))] );
end
d_per_class = d_per_class';
% クラス内分散
ov = 0;
for i = 1:c
    ov = ov + vw(i,1);
end
ov = ov / n;
disp( ['クラス内分散:' num2str(ov)] );

% Between-class variance クラス間分散
mm = mean( rgbdfea, 2 );%全データの平均ベクトル
ob = 0;
for i = 1:c
    tmp = ( ave_class(:,i) - mm )' * ( ave_class(:,i) - mm ) * (store_ind(i,2)-store_ind(i,1)+1);
    ob = ob + tmp;
end
ob = ob / n;
disp( ['クラス間分散:' num2str(ob)] );

    




