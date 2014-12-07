notes_dir = ~/notes
notes = $(notes_dir)/*
build_dir = ./build
tmp_dir = ./tmp
tmp_files = $(tmp_dir)/*


files := $(patsubst $(tmp_dir)/%.md,$(tmp_dir)/%.html,$(wildcard $(tmp_dir)/*.md))
objects := $(patsubst %.txt,%.html,$(wildcard *.txt))

all:
	@echo 'no default'

clean:
	rm $(tmp_files)

test:
	sh for i in $(tmp_files) ; do mv "$i" "${i/-[0-9.]*.md/.md}" ; done

copy: $(notes)
	cp -r $(notes) $(tmp_dir)
	cd $(tmp_dir)
	bash rename.sh $(tmp_dir)

build: $(files)

%.html: %.md
	markdown $< >> $@
