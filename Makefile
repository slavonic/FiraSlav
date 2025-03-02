build:
	fontforge -script hp-generate.py

all: FiraSlav.zip

FiraSlav.zip:
	rm -f *.otf *.zip
	fontforge -script hp-generate.py
	zip -j $@ *.otf OFL.txt

web: FiraSlav-Bold.woff2

FiraSlav-Bold.woff2:
	rm -f *.otf *.ttf *.woff *.eot *.woff2
	fontforge -script web-generate.py
	ttf2eot < FiraSlav-Regular.ttf > FiraSlav-Regular.eot
	ttf2eot < FiraSlav-Bold.ttf > FiraSlav-Bold.eot
	woff2_compress FiraSlav-Regular.ttf
	woff2_compress FiraSlav-Bold.ttf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip