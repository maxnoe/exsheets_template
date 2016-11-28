TeXOptions = \
  -lualatex \
  --output-directory=build \
  --interaction=nonstopmode \
  --halt-on-error

all: build/template.pdf build/solution.pdf

build/template.pdf: FORCE | build
	latexmk $(TeXOptions)  template.tex

build/solution.pdf: FORCE | build
	latexmk $(TeXOptions) --jobname=solution  template.tex

FORCE:

build:
	mkdir -p build

clean:
	rm -rf build


.PHONY: all clean FORCE
