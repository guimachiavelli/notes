.PHONY: clean index

notes = ~/notes
build = dist
tmp = ./tmp
processed = $(tmp)/processed
partials = ./partials
tools = ./tools


files := $(patsubst $(tmp)/%.md,$(tmp)/%.html,$(wildcard $(tmp)/*.md))

all: clean copy build index

clean:
	-rm -rf $(tmp)

copy: $(notes)/*
	mkdir -p $(tmp)
	bash $(tools)/rename.sh $(notes) $(tmp)

build: $(files) 
	mv -f "$(tmp)"/*.html "$(build)"/

%.html: %.md
	cat $(partials)/header.html > $@
	markdown $< >> $@
	cat $(partials)/footer.html >> $@

index:
	cat $(partials)/header.html > $(build)/index.html
	bash $(tools)/create_index.sh $(build) >> $(build)/index.html
	cat $(partials)/footer.html >> $(build)/index.html

deploy:
	git subtree push --prefix $(build) origin gh-pages
