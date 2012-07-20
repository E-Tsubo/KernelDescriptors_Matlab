"""
Written by Hideshi Tsubota 2012/07/21

-How to

$ python Segmentation.py root/

-Segment images are saved at crop/class/instance/*.png

-Folder structure
root/class/instance/*.png
"""

import re
import sys
import os
import Image
import string
from shutil import *

def crop( input, outputdir ):
    #print input, outputdir
    id = input.rindex( "/" )
    #print input[id+1:]
    output = outputdir + input[id+1:]
    print input, outputdir
    
    try:
        imask = input.index( "maskcrop" )
    except:
        return
        
    basename = input[0:imask]
    outputdir += input[id+1:imask]
    #print basename, outputdir
    rgbcrop = basename + "crop.png"
    depcrop = basename + "depthcrop.png"
    loctxt = basename + "loc.txt"
    rgbim = Image.open( rgbcrop )
    depim = Image.open( depcrop )
    
    out_rgbcrop = outputdir + "crop.png"
    out_depcrop = outputdir + "depthcrop.png"
    out_loctxt = outputdir + "loc.txt"
    
    #Mask Image
    maskImg = Image.open( input )
    gray = list( maskImg.getdata() )
    
    #Rectangle 
    left = maskImg.size[0]
    right = 0
    top = maskImg.size[1]
    down = 0
    
    for y in range( 0, maskImg.size[1] ):
        for x in range( 0, maskImg.size[0] ):
            offset = y * maskImg.size[0] + x
            pix = gray[offset]
            
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
    sub_x = -1 * int(left)
    sub_y = -1 * int(top)
    
    print "DEBUG(width, height): ", maskImg.size[0], maskImg.size[1]
    print "DEBUG(Segment:left, top, right, down): ", left, top, right, down
    
    roi = rgbim.crop( box )
    roi.save( out_rgbcrop )
    roi = depim.crop( box )
    roi.save( out_depcrop )
    
    #loc.txt
    loc = open( loctxt, "r" )
    for line in loc:
        linelist = line[:].split(", ")
        #print linelist
        string = str( int(linelist[0])-int(sub_x) ) + ", " + str( int(linelist[1])-int(sub_y) )
        wloc = open( out_loctxt, "w" )
        wloc.writelines( string )
        wloc.close()
### End of the Function ###


savepath = "crop"
if( True != os.path.isdir( savepath ) ):
    os.mkdir( savepath )

path = sys.argv[1]
for root, dirs, files in os.walk(path):
    subdir = root.split( "/" )
    #print subdir
    tmp = savepath + "/"
    for i in range( len(subdir)-1 ):
        tmp += subdir[i+1] + "/"
        if( True != os.path.isdir( tmp ) ):
            os.mkdir( tmp )
    #print tmp
    
    for file in files:
        #print root, file
        #print os.path.join(root, file)
        crop( os.path.join(root, file), tmp )
