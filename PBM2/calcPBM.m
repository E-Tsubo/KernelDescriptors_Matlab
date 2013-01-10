%% 2012/11/26 Written by Hideshi T.

disp( 'Please input rgb, dep image' );
USE_PART_MODEL = 5;

for i = 1:USE_PART_MODEL
    
    [tmp_dec, tmp_label, tmp_features, tmp_name] = process_PartBasedModel2( PBM.partdetector, i, rgb, dep, loc );
    
    part_decvalues{i} = tmp_dec;
    part_label{i} = tmp_label;
end

[ final_dec, final_label ] = combineModel( part_decvalues, part_label, PBM.combinedetector.svm, PBM.combinedetector.minvalue, PBM.combinedetector.maxvalue ); 

disp( ' ' );
disp( [ 'Detected Object is ' tmp_name{final_label} ] );
disp( final_dec );