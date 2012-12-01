%% PBM

USE_PART_MODEL = 5;

for i = 1:USE_PART_MODEL
    PBM.partdetector.partmodel{i} = partmodel{i};
    PBM.partdetector.featurenum(i) = length( partmodel{i} );
    for j = 1:PBM.partdetector.featurenum(i)
        PBM.partdetector.feature{i,j} = partmodel{i}{j}.kdes.kdes_params.type;
        PBM.partdetector.input{i,j} = partmodel{i}{j}.inputdata;
        %{
        if PBM.partdetector.input{i,j} ~= 1
            PBM.partdetector.feature{i,j} = PBM.partdetector.feature{i,j} - 1;
        end
        %}
    end
    
    PBM.combinedetector.svm = combinePBM;
    PBM.combinedetector.maxvalue = maxvalue;
    PBM.combinedetector.minvalue = minvalue;
end

disp( 'Save Part-based Model...' );
save PBM;
%clear partmodel combineModel trainfea