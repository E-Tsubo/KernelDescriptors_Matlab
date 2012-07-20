"""
Written by Hideshi Tsubota on 2012/07/19 @DHRC
Please use this program.
crop.py is experimental code.

How to
Please move the above folder stores train images.
e.x. ./image/koaramarch/***.png
     Please move ./image folder.
    
Type following...
$ python file.py koaramarch/
"""
import re
import sys
import os
import Image
import string
from shutil import *

sub_x = 0
sub_y = 0

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

    print left, top, right, down
    global sub_x
    global sub_y
    sub_x = -1 * int(left)
    sub_y = -1 * int(top)
    
    #roi = im.crop( box )
    roi = rgbim.crop( box )
    roi.save( rgbcrop )
    roi = depim.crop( box )
    roi.save( depcrop )
###End########

savepath = "crop"

if( True != os.path.isdir( savepath ) ):
    os.mkdir( savepath );


files = os.listdir( sys.argv[1] )
for f in files:
    if( re.search( "maskcrop", f ) ):
        print f
        p = sys.argv[1] + f
        crop( p, savepath );
    if( re.search( "loc.txt", f ) ):
        loc = open( sys.argv[1]+f, "r" )
        for line in loc:
            linelist = line[:].split(", ")
            #print linelist
            print sub_x, sub_y
            string = str( int(linelist[0])-int(sub_x) ) + ", " + str( int(linelist[1])-int(sub_y) )
            #print str
        wloc = open( savepath+"/"+f, "w" )
        wloc.writelines( string )
        wloc.close()
        #copy( sys.argv[1]+f, savepath+"/"+f )


