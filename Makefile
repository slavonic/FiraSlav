all: FiraSlav.zip

FiraSlav.zip:
	rm -f *.otf *.zip
	fontforge -script hp-generate.py
	zip -j $@ *.otf OFL.txt

clean:
	rm -f *.otf *.zip
