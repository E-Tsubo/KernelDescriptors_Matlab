%Edit label num
L = 4;

for i = 1:L
    SCORE.TP(i) = 0; %ê≥ÇµÇ≠positive ROC
    SCORE.FP(i) = 0; %åÎÇ¡Çƒpositive ROC
    SCORE.TN(i) = 0; %ê≥ÇµÇ≠negative
    SCORE.FN(i) = 0; %åÎÇ¡Çƒnegative
end

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
color{5} = 'g'; color{6} = 'y'; color{7} = 'w'; color{8} = 'k';
titlestr{1} = 'Class1'; titlestr{2} = 'Class2'; titlestr{3} = 'Class3';
titlestr{4} = 'Class4';

for iL = 1:L
   accuracy = (SCORE.TP(iL)+SCORE.TN(iL))/length(store_fl);
   precision = SCORE.TP(iL)/(SCORE.TP(iL)+SCORE.FP(iL));
   recall = SCORE.TP(iL)/(SCORE.TP(iL)+SCORE.FN(iL));
   
   scores = [];
   for i = 1:length(store_fl)
        scores(i,1) = store_fd{i}(iL);
        %scores(i,1) = store_fd{i}{1}(iL);
   end
   [X,Y,T,AUC,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(rgbdclabel', scores, iL);
   roc_h{iL} = plot(X, Y, color{iL});
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
roc_h{1} = legend( titlestr{1}, titlestr{2}, titlestr{3}, titlestr{4} );