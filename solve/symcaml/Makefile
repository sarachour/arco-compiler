
all: repo origin

init:
	rm -rf git-repo
	git clone git@github.mit.edu:sachour/symcaml.git git-repo/symcaml
	cp git-repo/symcaml/src/*.ml .
	cp git-repo/symcaml/src/*.mly .
	cp git-repo/symcaml/src/*.mll .

repo:
	cp *.ml git-repo/symcaml/src/
	cp *.mll git-repo/symcaml/src/
	cp *.mly git-repo/symcaml/src/

origin:
	cd git-repo/symcaml; git commit -a; git push
clean:
	rm *.ml *.mll *.mly
