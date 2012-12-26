%Edit label num
L = 4;

for i = 1:L
    SCORE.TP(i) = 0; %正しくpositive ROC
    SCORE.FP(i) = 0; %誤ってpositive ROC
    SCORE.TN(i) = 0; %正しくnegative <-Multiclassでは指標にならない.
    SCORE.FN(i) = 0; %誤ってnegative
end

cmatrix = zeros( L, L );

for iL = 1:L %Positive Label
    for i = 1:length(store_fl) %All Data
    
        tmp_true_label = store_name(i,2);
        tmp_pred_label = store_fl(i);

        if tmp_true_label{1} == iL
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
            cmatrix( tmp_pred_label, tmp_true_label{1} ) = cmatrix( tmp_pred_label, tmp_true_label{1} ) + 1;
        end
        
    end
end

sum_t = sum( cmatrix, 1);
sum_p = sum( cmatrix, 2);
for i = 1:L
    for j = 1:L
        rcmatrix(i,j) = cmatrix(i,j) / sum_t( 1,j );
        pcmatrix(i,j) = cmatrix(i,j) / sum_p( j,1 );
    end
end

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
titlestr{1} = '提案手法 Class1'; titlestr{2} = '提案手法 Class2'; titlestr{3} = '提案手法 Class3';
titlestr{4} = '提案手法 Class4';

for iL = 1:L
   %accuracy = (SCORE.TP(iL)+SCORE.TN(iL))/length(store_fl);
   accuracy = cmatrix(iL, iL)/sum_t(iL);
   precision = SCORE.TP(iL)/(SCORE.TP(iL)+SCORE.FP(iL));
   recall = SCORE.TP(iL)/(SCORE.TP(iL)+SCORE.FN(iL));
   
   scores = zeros(length(store_fl), 1);
   for i = 1:length(store_fl)
        scores(i,1) = store_fd{i}(iL);
        %scores(i,1) = store_fd{i}{1}(iL);
   end
   [X{iL},Y{iL},T,AUC,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(rgbdclabel', scores, iL);
   roc_h{iL} = plot(X{iL}, Y{iL}, color{mod(iL,7)+1});
   %clear X Y T AUC OPTROCPT SUBY SUBYNAMES;
   xlabel('False Positive Rate');
   ylabel('True Positive Rate');
   title(['ROC Curve']);
   hold on;
   
   SCORE.eval(iL,1) = accuracy;
   SCORE.eval(iL,2) = precision;
   SCORE.eval(iL,3) = recall;
   
   disp('  ');
   disp(['Class ' num2str(iL)]);
   disp(['Accuracy   ' num2str(accuracy) ]);
   disp(['Precision  ' num2str(precision) ]);
   disp(['Recall     ' num2str(recall) ]);
   
end
%roc_h{1} = legend( titlestr{1}, titlestr{2}, titlestr{3}, titlestr{4} );


% C-Matrix
%{
for iL = 1:L
    for jL = 1:L
        
    end
end
%}
