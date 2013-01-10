%Edit label num
%please load data array.
%data = load('');
L = 50;

for i = 1:L
    SCORE.TP(i) = 0; %ê≥ÇµÇ≠positive ROC
    SCORE.FP(i) = 0; %åÎÇ¡Çƒpositive ROC
    SCORE.TN(i) = 0; %ê≥ÇµÇ≠negative <-MulticlassÇ≈ÇÕéwïWÇ…Ç»ÇÁÇ»Ç¢.
    SCORE.FN(i) = 0; %åÎÇ¡Çƒnegative
end

cmatrix = zeros( L, L );

for iL = 1:L %Positive Label
    for i = 1:length(data) %All Data
    
        tmp_true_label = data(i,2);
        tmp_pred_label = data(i,3);

        if tmp_true_label == iL
            if tmp_pred_label == iL
                SCORE.TP(iL) = SCORE.TP(iL) + 1;
            else
                SCORE.FN(iL) = SCORE.FN(iL) + 1;
            end
        else
            if tmp_pred_label == iL
                SCORE.FP(iL) = SCORE.FP(iL) + 1;
            else
                SCORE.TN(iL) = SCORE.TN(iL) + 1;
            end
        end
        
        if iL == 1
            %confuze matrix
            cmatrix( tmp_pred_label, tmp_true_label ) = cmatrix( tmp_pred_label, tmp_true_label ) + 1;
        end
        
    end
end

sum_t = sum( cmatrix, 1);
sum_p = sum( cmatrix, 2);

%debug
%{
for iL = 1:L
   sum = SCORE.TP(iL) + SCORE.FN(iL) + SCORE.FP(iL) + SCORE.TN(iL);
   disp(sum);
end
%}

%accuuracy
color{1} = 'c'; color{2} = 'm'; color{3} = 'b'; color{4} = 'r';
color{5} = 'g'; color{6} = 'y'; color{7} = 'k'; 
titlestr{1} = 'Class1'; titlestr{2} = 'Class2'; titlestr{3} = 'Class3';
titlestr{4} = 'Class4'; titlestr{5} = 'Class5';

rgbdclabel = zeros( L, 1 );%rgbdclabel = [];
for i = 1:length(data)
    rgbdclabel(i,1) = data(i,2);
end

%X =struct; Y = struct;
%X = reshape(X, L, 1); Y = reshape(Y, L, 1);
X = cell(1,L); Y = cell(1,L);
%matlabpool open local 4;
%parfor iL = 1:L
for iL = 1:L
   %accuracy = (SCORE.TP(iL)+SCORE.TN(iL))/length(store_fl);
   accuracy = cmatrix(iL, iL)/sum_t(iL);
   precision = SCORE.TP(iL)/(SCORE.TP(iL)+SCORE.FP(iL));
   recall = SCORE.TP(iL)/(SCORE.TP(iL)+SCORE.FN(iL));
   
   scores = zeros(length(data), 1);
   for i = 1:length(data)
        scores(i,1) = data(i,iL+3);
        %scores(i,1) = store_fd{i}{1}(iL);
   end
   %tic;
   [X{iL},Y{iL},T,AUC,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(rgbdclabel, scores, iL);
   %toc;
   
   roc_h{iL} = plot(X{iL}, Y{iL}, color{mod(iL,7)+1});
   xlabel('False Positive Rate');
   ylabel('True Positive Rate');
   title(['ROC Curve']);
   hold on;
      
   SCORE.eval(iL,1) = accuracy;
   SCORE.eval(iL,2) = precision;
   SCORE.eval(iL,3) = recall;
   SCORE.eval(iL,4) = AUC;
   
   disp('  ');
   disp(['Class ' num2str(iL)]);
   disp(['Accuracy   ' num2str(accuracy) ]);
   disp(['Precision  ' num2str(precision) ]);
   disp(['Recall     ' num2str(recall) ]);
   
   clear T AUC OPTROCPT SUBY SUBYNAMES;
end
%roc_h{1} = legend( titlestr{1}, titlestr{2}, titlestr{3}, titlestr{4} );


% C-Matrix
%{
for iL = 1:L
    for jL = 1:L
        
    end
end
%}
