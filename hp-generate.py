import fontforge;

base_name = "FiraSlav"

fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges",False )
fontforge.setPrefs ( "CopyTTFInstrs",True )
flavor = ("Regular", "Medium", "Bold")

for i in range(0, len (flavor)):
    font = fontforge.open(base_name + "-" + flavor[i] + ".sfd")
    font.head_optimized_for_cleartype = True

    font.generate( base_name + "-" + flavor[i] + ".otf", flags=( "opentype", "PfEd-colors", "PfEd-lookups"), layer="Fore" )
    font.close ()


