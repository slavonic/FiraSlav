import fontforge;

##
## THIS FILE IS A FONTFORGE SCRIPT THAT GENERATES WEB FONTS FAMILY
##
##

base_name = "FiraSlav"

fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges",False )
fontforge.setPrefs ( "CopyTTFInstrs",True )
flavor = ("Regular", "Bold")

for i in range(0, len (flavor)):
    ## open up the font
    font = fontforge.open(base_name + "-" + flavor[i] + ".sfd")
    font.head_optimized_for_cleartype = True

    # generate TTF fonts
    font.em = 1024
    font.generate( base_name + "-" + flavor[i] + ".ttf", flags=( "opentype", "old-kern", "PfEd-colors", "PfEd-lookups", "dummy-dsig" ), layer="Fore" )

    #generate WOFF fonts
    woff_meta = base_name + "-WOFF-metadata.xml"
    f = file( woff_meta, 'r')
    lines = f.readlines()
    f.close()
    font.woffMetadata = "".join( lines )
    font.generate( base_name + "-" + flavor[i] + ".woff", flags=( "opentype"), layer="Fore" )
    font.close()
