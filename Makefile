DRAWBOT_OUTPUT=$(shell ls documentation/*.py | sed 's/\.py/.png/g')

build: venv build.stamp

build.stamp:
	fontforge -script hp-generate.py
	. venv/bin/activate; fonttools ttLib.woff2 compress -o fonts/webfonts/FiraSlav-Regular.woff2 fonts/ttf/FiraSlav-Regular.ttf
	. venv/bin/activate; fonttools ttLib.woff2 compress -o fonts/webfonts/FiraSlav-Bold.woff2 fonts/ttf/FiraSlav-Bold.ttf
	touch build.stamp

venv: venv/touchfile

venv/touchfile: requirements.txt
	test -d venv || python3 -m venv venv
	. venv/bin/activate; pip install -Ur requirements.txt
	touch venv/touchfile

images: venv $(DRAWBOT_OUTPUT)

%.png: %.py build.stamp
	. venv/bin/activate; python3 $< --output $@

otf-package: FiraSlav-OTF.zip

FiraSlav-OTF.zip:
	rm -f *.otf
	cp fonts/otf/*.otf ./
	zip -r -q FiraSlav-OTF.zip *.otf
	rm -f *.otf

ttf-package: FiraSlav-TTF.zip

FiraSlav-TTF.zip:
	rm -f *.ttf
	cp fonts/ttf/*.ttf ./
	zip -r -q FiraSlav-TTF.zip *.ttf
	rm -f *.ttf

clean:
	rm -f build.stamp *.zip
	rm -rf venv
	find . -name "*.pyc" -delete
