### Workflow
#
# 1. Run [Update](update)
# 2. View the [Action0](build/action0.txt) file.
# 3. View the [Action1](build/action1.txt) file.
# 4. View the [Action2](build/action2.txt) file.
# 5. Run the script [Hobbit-script](./build/hobbit-script.sh).
# 6. Look in the [build](build/) directory.
# 5. Read the news at [CBC News](https://www.cbc.ca/news)
# 6. Clean up
#     - [Clean](clean)


.PHONY: clean update

update: build/action0.txt build/action1.txt build/action2.txt build/hobbit-script.sh

build/action0.txt: | build
	countdown 20
	date > build/action0.txt

build/action1.txt: build/action0.txt | build
	countdown 21
	date > build/action1.txt

build/action2.txt: build/action1.txt | build
	countdown 22
	date > build/action2.txt

build/index.html: | build
	echo "<html><h1>Hello!</h1></html>" > build/index.html

build/hobbit-script.sh: | build
	echo "#!/usr/bin/sh" > build/hobbit-script.sh
	echo "echo hey there" >> build/hobbit-script.sh
	chmod u+x build/hobbit-script.sh

build:
	mkdir -p $@

clean:
	rm -Rf build
