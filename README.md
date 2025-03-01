# FiraSlav Typeface

FiraSlav is a monospaced font for Church Slavonic.

Editing Church Slavonic text in a text editor can be complicated because
stacking diacritical marks are difficult to visually identify and correct.
This font treats all diacritical marks and combining letters as spacing
symbols and maintains a monospaced appearance, ideal for text editing projects.

![Sample Image](documentation/image2.png)

## History

- Based on [Fira Mono 3.2](https://github.com/bBoxType/FiraSans)
- Fira is a trademark of The Mozilla Corporation.
- Digitized data copyright 2012-2018, The Mozilla Foundation and Telefonica S.A., bBox Type GmbH and Carrois Corporate GbR, with Reserved Font Name "Fira" 
- Design 2012-2015: Carrois Corporate GbR & Edenspiekermann AG
- Design 2016 and later: bBox Type GmbH
- Additional Design 2019: Aleksandr Andreev

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

## Fira Slav font weights:

* Regular 		(84em / CSS 400)
* Bold  		(158em / CSS 700)
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

## License

This Font Software is licensed under the SIL Open Font License,
Version 1.1. This license is available with a FAQ at
[https://openfontlicense.org/](https://openfontlicense.org/).
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

## Building the Fonts

The font is built using fontmake and gftools post processing script. Tools are all python based, so it must be previously installed.

To install all the Python tools into a virtualenv, do the following:

From terminal:

```

cd your/local/project/directory

#once in the project folder create a virtual environment. 
This step has to be done just once, the first time:

python3 -m venv venv

#activate the virtual environment

source venv/bin/activate

#install the required dependencies

pip install -r requirements.txt

```

Then run the this command:

```
cd sources
gftools builder config.yaml
```

The fonts are supposed to build automatically in the repository 
using GitHub Actions, but this does not work correctly.

## More Church Slavonic Fonts

See the [main repository](https://github.com/typiconman/fonts-cu/issues) and the [website](https://sci.ponomar.net/fonts.html).
