### Workflow
#
# 1. Runs [Update](update)
# 2. View the [Action0](build/action0.txt) file.
# 3. View the [Action1](build/action1.txt) file.
# 4. View the [Action2](build/action2.txt) file.
# 5. Run the script [Orc script](./orc-script.py?cgi-input-py=degrassi)
# 5. Run the script [Hobbit-script (python version)](./build/hobbit-script.py?cgi-input-py=degrassi).
# 5. Run the script [Hobbit-script (bash version)](./build/hobbit-script.sh?foo=barzork).
# 6. Look in the [build](build/) directory.
# 5. Read the news at [CBC News](https://www.cbc.ca/news)
# 6. Clean up
#     - [Clean](clean)
# 1. [Make sure that everything is ok](git status)
# 2. [See what's different](git diff)
# 3. [Fetch a stick](git fetch)
# 4. [Pull up your pants](git pull)
# 9. [Don't be afraid to commit](git commit)
# 10. [Amend it if you need to](git amend)
# 11. [Push it to the repo](git push)
# 12. [ANd what do we do now?](git nonsense)


.PHONY: clean update scripts

update: build/action0.txt build/action1.txt build/action2.txt build/hobbit-script.py build/hobbit-script.sh orc-script.py

scripts: build/hobbit-script.py build/hobbit-script.sh orc-script.py

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

orc-script.py:
	chmod u+x orc-script.py

build/hobbit-script.py: | build
	cp hobbit-script.py build/
	chmod u+x build/hobbit-script.py

build/hobbit-script.sh: | build
	cp hobbit-script.sh build/
	chmod u+x build/hobbit-script.sh

build:
	mkdir -p $@

clean:
	rm -Rf build
