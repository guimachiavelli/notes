notes_dir = ~/notes
notes = $(notes_dir)/*
build_dir = ./build
tmp_dir = ./tmp
tmp_files = $(tmp_dir)/*


files := $(patsubst $(tmp_dir)/%.txt,$(tmp_dir)/%.html,$(wildcard $(tmp_dir)/*.txt))
objects := $(patsubst %.txt,%.html,$(wildcard *.txt))

all:
	@echo 'no default'

clean:
	rm $(tmp_files)

build: 
	cp -r $(notes) $(tmp_dir)
	rename "s/ /_/g" $(tmp_dir)/*.*


test: $(files)

%.html: %.txt
	markdown $< >> $@

