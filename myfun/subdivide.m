function divimage()
%2012/09/30 Written by Hideshi Tsubota @HOME

list = dir('*_crop.png');

mkdir( 'divimg' );



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
    
    