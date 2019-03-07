all: FiraSlav.zip

FiraSlav.zip:
	rm -f *.otf *.zip
	fontforge -script hp-generate.py
	zip -j $@ *.otf OFL.txt

web: FiraSlav.woff2

FiraSlav.woff2:
	rm -f *.otf *.ttf *.woff *.eot *.woff2
	fontforge -script web-generate.py
	ttf2eot < FiraSlav-Regular.ttf > FiraSlav-Regular.eot
	woff2_compress FiraSlav-Regular.ttf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip