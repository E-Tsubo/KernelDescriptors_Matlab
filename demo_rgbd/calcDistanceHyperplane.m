if 0
   for i = 1:model.nr_class
       W = norm( model.w( i, : ) );
       nm( i, 1 ) = 1.0 / W;
   end
end

if 0
    for i = 1:length( ttestindex )
        for j = 1:model.nr_class
            W = norm( model.w( j, : ) );
            disHyperplane( i, j ) = decvalues( i, j ) / W;
        end
    end
end

if 1
    for i = 1:model.nr_class
        total(1,i) = 0;
        for j = 1:length(testlabel)
            if testlabel( 1, j ) == i
                total(1,i) = total(1,i) + 1;
            end
        end
        disp(total(1,i));
    end
    
    index = 1;
    for i = 1:model.nr_class
        accu( 1, i ) = 0;
        for j = 1:total(1,i)
            if predictlabel( index, 1 ) == testlabel( 1, index )
                accu(1, i) = accu(1, i) + 1;
            end
            index = index + 1;
        end
        accu( 2, i ) = accu( 1, i ) / total( 1, i );
    end
end