% 2012/09/14 Written by Hideshi Tsubota @DHRC
% Now only liblinear( linear kernel ) is supported
% 

bestcv = 0;
bestc=-1;
bestg=-1;
for log2c = -1:3
    %for log2g = -4:1
        %cmd = ['-v 5 -c ', num2str(2^log2c), ' -g ', num2str(2^log2g) ];
        cmd = ['-v 5 -c ', num2str(2^log2c) ];
        cv = train(trainlabel', trainhmp', cmd);
        if(cv >= bestcv)
            bestcv = cv; bestc = 2^log2c; %bestg = 2^log2g;
        end
        %fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
        disp( bestc );
    %end
end
option = ['-s 1 -c ' num2str(bestc)];