import sys
import Image
import string

im = Image.open("testg.png")
#im.show()
print "Format", im.format, ", widsh", im.size[0], ", height", im.size[1]

rgbim = im.convert( "L" )
rgb = list( rgbim.getdata() )
#print rgb
#print len( rgb )
#print rgb[im.size[0]*im.size[1]-1][0], rgb[im.size[0]*im.size[1]-1][1], rgb[im.size[0]*im.size[1]-1][2]

left = im.size[0]
right = 0
top = im.size[1]
down = 0

count = 0
for y in range( 0, im.size[1] ):
    for x in range( 0, im.size[0] ):
        offset = y * im.size[0] + x
        pix = rgb[offset]
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
        
#left_top = [ int(left), int(top) ]
#right_top = [ int(right), int(top) ]
#left_down = [ int(left), int(down) ]
#right_down = [ int(right), int(down) ]
#print str.isdigit(right_top[0])
#box = ( left_top[0], left_top[1], right_down[0]-left_top[0], right_down[1]-right_top[1] )
box = ( int(left), int(top), int(right), int(down) )
roi = im.crop( box )
roi.save( "t.png" )
#roi.show()
