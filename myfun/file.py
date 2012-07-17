import re
import sys
import os
import Image
import string
from shutil import *

###Function###
def crop( name, path ):
    
    i = name.index( "/" )
    imname = name[i+1:]
    filepath = path + "/" + imname
    
    ii = imname.index( "maskcrop" )
    basename = imname[0:ii]
    rgbcrop = basename + "crop.png"
    depcrop = basename + "depthcrop.png"
    
    iii = name.index( "/" )
    prename = name[0:iii]
    #print prename+"/"+rgbcrop
    rgbim = Image.open( prename + "/" + rgbcrop )
    depim = Image.open( prename + "/" + depcrop )
    
    rgbcrop = path + "/" + basename + "crop.png"
    depcrop = path + "/" + basename + "depthcrop.png"
    print rgbcrop, depcrop
    
    #Mask Image
    im = Image.open( name )
    tmp = im.convert( "L" )
    gray = list( tmp.getdata() )
    
    #Rectangle 
    left = im.size[0]
    right = 0
    top = im.size[1]
    down = 0
    
    for y in range( 0, im.size[1] ):
        for x in range( 0, im.size[0] ):
            offset = y * im.size[0] + x
            pix = gray[offset]
            """
            print pix
            if( pix == 255 ):
            print pix
            count = count + 1
            """
            if( pix == 255 ):
                if( left > x ):
                    left = x
                if( right < x ):
                    right = x
                if( top > y ):
                    top = y
                if( down < y ):
                    down = y

    box = ( int(left), int(top), int(right), int(down) )
    #roi = im.crop( box )
    roi = rgbim.crop( box )
    roi.save( rgbcrop )
    roi = depim.crop( box )
    roi.save( depcrop )
###End########

savepath = "crop"

if( True != os.path.isdir( savepath ) ):
    os.mkdir( "./depth" );


files = os.listdir( sys.argv[1] )
for f in files:
    if( re.search( "maskcrop", f ) ):
        print f
        p = sys.argv[1] + f
        crop( p, savepath );
    if( re.search( "loc.txt", f ) ):
        copy( sys.argv[1]+f, savepath+"/"+f )


