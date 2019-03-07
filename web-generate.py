import fontforge;

##
## THIS FILE IS A FONTFORGE SCRIPT THAT GENERATES WEB FONTS FAMILY
##
##

base_name = "FiraSlav-Regular"
full_name  = "FiraSlav"

fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges",False )
fontforge.setPrefs ( "CopyTTFInstrs",True )

## open up the font
font = fontforge.open(base_name + ".sfd")
font.head_optimized_for_cleartype = True

# generate TTF fonts
font.em = 1024
font.generate( base_name + ".ttf", flags=( "opentype", "old-kern", "PfEd-colors", "PfEd-lookups", "dummy-dsig" ), layer="Fore" )

#generate WOFF fonts
woff_meta = full_name + "-WOFF-metadata.xml"
f = file( woff_meta, 'r')
lines = f.readlines()
f.close()
font.woffMetadata = "".join( lines )
font.generate( base_name + ".woff", flags=( "opentype"), layer="Fore" )
font.close()
