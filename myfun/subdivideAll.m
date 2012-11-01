function divimage( path, flag)
%2012/10/09 Written by Hideshi Tsubota @HOME
%{
    How to use this program
    
    path:source image folder's path
    e.x. $> divimage( 'rgbdsubset', 1);
    
    what's flag?
    flag means the sub-divided region
    so, above e.x., extract only left part of the input image.

    1:Left-Side
    2:Right-Side
    3:Top-Side
    4:Bottom-Side
    5:Left-Top-Side
    6:Left-Bottom-Side
    7:Right-Top-Side
    8:Right-Bottom-Side

%}

savepath = 'subdivide_bottom';
mkdir( savepath );

list = dir( path );
for i = 3:length(list)
    % to skip . and .. folder, start i = 3.
    
    % Class layer
    disp( list(i).name );
    mkdir( [savepath '/' list(i).name] );
    instance_list = dir( [ path '/' list(i).name ] );
        
    for j = 3:length(instance_list)
        % Instance layer
        mkdir( [savepath '/' list(i).name '/' instance_list(j).name] );
        disp( instance_list(j).name );
        
        rgb_path = [ path '/' list(i).name '/' instance_list(j).name '/*_crop.png' ];
        dep_path = [ path '/' list(i).name '/' instance_list(j).name '/*_depthcrop.png' ];
        loc_path = [ path '/' list(i).name '/' instance_list(j).name '/*_loc.txt' ];
        
        rgb_list = dir( rgb_path );
        dep_list = dir( dep_path );
        loc_list = dir( loc_path );
        
        %disp( length(rgb_list) );
        for k = 1:length(rgb_list)
            disp( rgb_list(k).name );
            disp( dep_list(k).name );
            disp( loc_list(k).name );
            
            rgb = imread( [ path '/' list(i).name '/' instance_list(j).name '/' rgb_list(k).name ] );
            dep = imread( [ path '/' list(i).name '/' instance_list(j).name '/' dep_list(k).name ] );
            loc = load( [ path '/' list(i).name '/' instance_list(j).name '/' loc_list(k).name ] );
            
            %Sub-Divied
            switch flag
                            
                % Left-Side
                case 1
                    width = length( rgb(1,:,1) );
                                        
                    out_rgb = rgb( :, 1:floor(width/2), : );
                    out_dep = dep( :, 1:floor(width/2), : );
                    out_loc = loc;
                    
                    rgb_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' rgb_list(k).name ];
                    dep_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' dep_list(k).name ];
                    loc_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' loc_list(k).name ];
                    
                    imwrite( out_rgb, rgb_str );
                    imwrite( out_dep, dep_str );
                    fid = fopen( loc_str, 'w' );
                    fprintf( fid, '%d, %d\n', out_loc(1,1), out_loc(1,2) );
                    fclose(fid);
                
                % Right-Side
                case 2
                    width = length( rgb(1,:,1) );
                    
                    out_rgb = rgb( :, floor(width/2):width, : );
                    out_dep = dep( :, floor(width/2):width, : );
                    loc(1,2) = loc(1,2) + floor(width/2);
                    out_loc = loc;
                    
                    rgb_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' rgb_list(k).name ];
                    dep_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' dep_list(k).name ];
                    loc_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' loc_list(k).name ];
                    
                    imwrite( out_rgb, rgb_str );
                    imwrite( out_dep, dep_str );
                    fid = fopen( loc_str, 'w' );
                    fprintf( fid, '%d, %d\n', out_loc(1,1), out_loc(1,2) );
                    fclose(fid);
                    
                % Top-Side
                case 3
                    height = length( rgb(:,1,1) );
                    
                    out_rgb = rgb( 1:floor(height/2), :, : );
                    out_dep = dep( 1:floor(height/2), :, : );
                    out_loc = loc;
                    
                    rgb_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' rgb_list(k).name ];
                    dep_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' dep_list(k).name ];
                    loc_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' loc_list(k).name ];
                    
                    imwrite( out_rgb, rgb_str );
                    imwrite( out_dep, dep_str );
                    fid = fopen( loc_str, 'w' );
                    fprintf( fid, '%d, %d\n', out_loc(1,1), out_loc(1,2) );
                    fclose(fid);
                    
                % Bottom-Side
                case 4
                    height = length( rgb(:,1,1) );
                    
                    out_rgb = rgb( floor(height/2):height, :, : );
                    out_dep = dep( floor(height/2):height, :, : );
                    loc(1,1) = loc(1,1) + floor(height/2);
                    out_loc = loc;
                    
                    rgb_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' rgb_list(k).name ];
                    dep_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' dep_list(k).name ];
                    loc_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' loc_list(k).name ];
                    
                    imwrite( out_rgb, rgb_str );
                    imwrite( out_dep, dep_str );
                    fid = fopen( loc_str, 'w' );
                    fprintf( fid, '%d, %d\n', out_loc(1,1), out_loc(1,2) );
                    fclose(fid);
                    
                % Left-Top-Side
                case 5
                    width = length( rgb(1,:,1) );
                    height = length( rgb(:,1,1) );
                    
                    out_rgb = rgb( 1:floor(height/2), 1:floor(width/2), : );
                    out_dep = dep( 1:floor(height/2), 1:floor(width/2), : );
                    out_loc = loc;
                    
                    rgb_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' rgb_list(k).name ];
                    dep_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' dep_list(k).name ];
                    loc_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' loc_list(k).name ];
                    
                    imwrite( out_rgb, rgb_str );
                    imwrite( out_dep, dep_str );
                    fid = fopen( loc_str, 'w' );
                    fprintf( fid, '%d, %d\n', out_loc(1,1), out_loc(1,2) );
                    fclose(fid);
                    
                % Left-Bottom-Side
                case 6
                    width = length( rgb(1,:,1) );
                    height = length( rgb(:,1,1) );
                    
                    out_rgb = rgb( floor(height/2):height, 1:floor(width/2), : );
                    out_dep = dep( floor(height/2):height, 1:floor(width/2), : );
                    loc(1,1) = loc(1,1) + floor(height/2);
                    out_loc = loc;
                    
                    rgb_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' rgb_list(k).name ];
                    dep_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' dep_list(k).name ];
                    loc_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' loc_list(k).name ];
                    
                    imwrite( out_rgb, rgb_str );
                    imwrite( out_dep, dep_str );
                    fid = fopen( loc_str, 'w' );
                    fprintf( fid, '%d, %d\n', out_loc(1,1), out_loc(1,2) );
                    fclose(fid);
                    
                % Right-Top-Side
                case 7
                    width = length( rgb(1,:,1) );
                    height = length( rgb(:,1,1) );
                    
                    out_rgb = rgb( 1:floor(height/2), floor(width/2):width, : );
                    out_dep = dep( 1:floor(height/2), floor(width/2):width, : );
                    loc(1,2) = loc(1,2) + floor(width/2);
                    out_loc = loc;
                    
                    rgb_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' rgb_list(k).name ];
                    dep_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' dep_list(k).name ];
                    loc_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' loc_list(k).name ];
                    
                    imwrite( out_rgb, rgb_str );
                    imwrite( out_dep, dep_str );
                    fid = fopen( loc_str, 'w' );
                    fprintf( fid, '%d, %d\n', out_loc(1,1), out_loc(1,2) );
                    fclose(fid);
                    
                % Right-Bottom-Side
                case 8
                    width = length( rgb(1,:,1) );
                    height = length( rgb(:,1,1) );
                    
                    out_rgb = rgb( floor(height/2):height, floor(width/2):width, : );
                    out_dep = dep( floor(height/2):height, floor(width/2):width, : );
                    loc(1,2) = loc(1,2) + floor(width/2);
                    loc(1,1) = loc(1,1) + floor(height/2);
                    out_loc = loc;
                    
                    rgb_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' rgb_list(k).name ];
                    dep_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' dep_list(k).name ];
                    loc_str = [ savepath '/' list(i).name '/' instance_list(j).name '/' loc_list(k).name ];
                    
                    imwrite( out_rgb, rgb_str );
                    imwrite( out_dep, dep_str );
                    fid = fopen( loc_str, 'w' );
                    fprintf( fid, '%d, %d\n', out_loc(1,1), out_loc(1,2) );
                    fclose(fid);
            end
                        
        end
    end
end

%{
for i = 1:length( list )
    img = imread( list(i).name );
    
    width = length( img(:,1,1) );
    height = length( img(1,:,1) );
    ch = 3;

    num_div = 2;

    width_div = floor( width / num_div );
    height_div = floor( height / num_div );
    
    for h = 1:num_div
        for w = 1:num_div
        
            width_s = (w-1) * width_div + 1;
            height_s = (h-1) * height_div + 1;
        
            width_e = width_s + width_div;
            height_e = height_s + height_div;
            if width_e > width
                width_e = width;
            end
            if height_e > height
                height_e = height;
            end
                
            img_div = img( width_s:width_e, height_s:height_e, 1:3 );
            str = ['divimg/img_' num2str(i) '_' num2str(w) '_' num2str(h) '.png'];
            imwrite( img_div, str);
        
            clear img_div;
        end
    end
    clear img;
end
    %}
    