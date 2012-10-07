function [ b_cv w_cv ] = variance2( rgbdclabel, rgbdilabel, rgbdfea, svmtype )
% 2012/09/26 Written by Hideshi Tsubota @HDRC

switch(svmtype)
    case '1-vs-rest'
        [ b_cv, w_cv ] = calcVariance_1vsREST( rgbdclabel, rgbdilabel, rgbdfea );
    case '1-vs-1'
        %
    otherwise
        warning(' Unknown type');
end

function [ b_cv w_cv ] = calcVariance_1vsREST( rgbdclabel, rgbdilabel, rgbdfea )

nr_n = length(rgbdclabel);%Total Number of input data
nr_c = max(rgbdclabel);%The Number of class

for i = 1:nr_c
    str = ['class' num2str(i)];
    classfea.(str) = 1;
end

idx_s = 1;
idx_store(1,1) = idx_s;
for i = 1:nr_c-1
    for j = idx_s:nr_n
        if rgbdclabel(1,j) ~= i
            idx_s = j;
            idx_store(i,2) = j-1;
            idx_store(i+1,1) = idx_s;
            % idx_store(?,1) is start index
            % idx_store(?,2) is end index
            break;
        end
    end
end
idx_store(nr_c,2) = nr_n;

% Create feature per class
for i = 1:nr_c
    tmp_fea = rgbdfea(:,idx_store(i,1):idx_store(i,2));
    fea_store.(['class' num2str(i)]) = tmp_fea;
    clear tmp_fea;
end

% Within-Class Variance クラス内分散
% 1-vs-rest... 1 and rest class
for i = 1:nr_c
    disp([' 1class is ' num2str(i)]);
    
    % in 1-vs-rest 1-class
    fea = fea_store.(['class' num2str(i)]);
    m = mean(fea,2);
    m_class(:,i) = m;

    sum = 0;
    for j = 1:(idx_store(i,2)-idx_store(i,1)+1)
        sum = sum + (fea(:,j)-m)' * (fea(:,j)-m);
    end
    tmpone_vari(i,1) = sum / (idx_store(i,2)-idx_store(i,1)+1);
    disp(['1クラス毎の分散:' num2str(tmpone_vari(i,1))]);
    
    % rest-class
    clear fea;
    fea = [];
    for j = 1:nr_c
        if i ~= j
            fea = [ fea fea_store.(['class' num2str(j)]) ];
        end
    end
    m = mean(fea,2);
    restm_class(:,i) = m;
    
    sum = 0;
    for j = 1:length(fea(1,:))
        sum = sum + (fea(:,j)-m)' * (fea(:,j)-m);
    end
    tmprest_vari(i,1) = sum / length(fea(1,:));
    disp(['Restクラスの分散:' num2str(tmprest_vari(i,1))]);
end

tmpone_vari = tmpone_vari';
tmprest_vari = tmprest_vari';
%{
within_vari = 0;
for i = 1:nr_c
    within_vari = within_vari + tmp_vari(i,1);
end
%}
for i = 1:nr_c
    within_vari(i,1) = ( tmpone_vari(1,i) + tmprest_vari(1,i) ) / 2.0;
    disp([ num2str(i) ' : クラス内分散 = ' num2str(within_vari(i,1))]);
end
w_cv = within_vari;%output


% Between-class variance クラス間分散
mm = mean(rgbdfea, 2);%全データのベクトル
for i = 1:nr_c
   tmpone = ( m_class(:,i)-mm )' * ( m_class(:,i)-mm ) * (idx_store(i,2)-idx_store(i,1)+1);
   tmprest = ( restm_class(:,i)-mm )' * ( restm_class(:,i)-mm) * (nr_n-(idx_store(i,2)-idx_store(i,1)+1));
   b_cv(i,1) = ( tmpone + tmprest ) / 2.0;
   disp( ['クラス間分散:' num2str(b_cv(i,1))] );
end

