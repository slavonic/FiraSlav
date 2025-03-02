import fontforge;

base_name = "FiraSlav"

fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges",False )
fontforge.setPrefs ( "CopyTTFInstrs",True )
flavor = ("Regular", "Bold")

for i in range(0, len (flavor)):
    font = fontforge.open("sources/" + base_name + "-" + flavor[i] + ".sfd")
    font.head_optimized_for_cleartype = True

    font.generate("fonts/otf/" + base_name + "-" + flavor[i] + ".otf", flags=( "opentype", "PfEd-colors", "PfEd-lookups"), layer="Fore" )
    font.em = 1024
    font.generate("fonts/ttf/" + base_name + "-" + flavor[i] + ".ttf", flags=( "opentype", "old-kern", "PfEd-colors", "PfEd-lookups", "dummy-dsig" ), layer="Fore" )
    font.close ()
