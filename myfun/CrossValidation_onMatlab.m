% 2012/09/24 Written by Hideshi Tsubota @DHRC

disp('Plese load rgbdfeature file and define k param');

%���͉摜��
nr_train = length(rgbdfea);
%���̓��x����
labelnum = unique(rgbdclabel);

%��������ɗp����f�[�^�����̏���
for i = 1:k
    fold_start(i) = floor((i-1)*nr_train/k+1);
end
for i = 1:k
    if i == k
        fold_end(i) = nr_train;
    else
        fold_end(i) = fold_start(i+1)-1;
    end
end

%��������
for loop = 1:k
    disp(['Iter for Cross validation is ' num2str(loop)]);

    trainindex = [];
    testindex = [];
    
    for j = 1:length(labelnum)
        tmp_trainindex = find(rgbdclabel == labelnum(j)); 
        trainindex = [ trainindex tmp_trainindex ];
    end
    %��������Ńe�X�g�ɗp����f�[�^�̃C���f�b�N�X���i�[
    for j = fold_start(loop):fold_end(loop)
        testindex = [ testindex, j ];
    end
    
    %�e�X�g�p�̃f�[�^���g���[�j���O�f�[�^����폜
    trainindex(testindex) = [];
    
    trainhmp = rgbdfea(:,trainindex);
    testhmp = rgbdfea(:,testindex);
    trainlabel = rgbdclabel(trainindex);
    testlabel = rgbdclabel(testindex);
    
    %For libsvm and liblinear
    trainhmp = double( trainhmp );
    trainhmp = sparse( trainhmp );
    testhmp = double( testhmp );
    testhmp = sparse( testhmp );
            
    [trainhmp, minvalue, maxvalue] = scaletrain(trainhmp, 'linear');
    testhmp = scaletest(testhmp, 'linear', minvalue, maxvalue);
     
     %{
     SVM Param C
     %}
     lc = 3;
     option = ['-s 1 -c ' num2str(lc)];
     model = train(trainlabel',trainhmp',option);
     [predictlabel, accuracy, decvalues] = predict(testlabel', testhmp', model);
     
     %Calc Distance from Hyperplane
     ttestindex = testindex;
     calcDistanceHyperplane;
     savefile = ['dec_value_' num2str(loop) '.mat'];
     save( savefile, 'disHyperplane', 'nm', 'cm', 'accu', 'total', 'decvalues' );
          
     clear trainindex testindex lc model option predictlabel accuracy decvalues minvalue maxvalue;
end