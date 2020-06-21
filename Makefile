### Workflow
#
# 1. [Update](update)
# 2. Look into the [Build](build/) directory and admire the pretty `index.html` file
# 3. View the [Action0](build/action0.txt) file.
# 4. View the [Action1](build/action1.txt) file.
# 5. View the [Action2](build/action2.txt) file.
# 6. Read the news at [CBC News](https://www.cbc.ca/news)
# 7. [Clean up](clean)
# 8. Have a look at the file called [hello.txt](build/schmuild/hello.txt)

.PHONY: clean update

update: build/action0.txt build/action1.txt build/action2.txt

build/index.html: | build
	cp -f /home/mike/Temp/index.html build/

build/action0.txt: | build
	countdown 20
	date > build/action0.txt

build/action1.txt: build/action0.txt | build
	countdown 21
	date > build/action1.txt

build/action2.txt: build/action1.txt | build
	countdown 22
	date > build/action2.txt

build:
	mkdir -p $@

clean:
	rm -Rf build
