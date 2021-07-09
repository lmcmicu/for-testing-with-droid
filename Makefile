### Workflow
#
# 1. Runs [Update](update)
# 2. View the [Action0](build/action0.txt) file.
# 3. View the [Action1](build/action1.txt) file.
# 4. View the [Action2](build/action2.txt) file.
# 5. Look at the [Excel script](./build/excel.py)
# 3. Get into the [Elf script](./build/elf-script.py)
# 3. Have a gander at the [Balrog script](./build/balrog-script.py)
# 5. Run the script [Orc script](./orc-script.py?cgi-input-py=degrassi)
# 5. Run the script [Hobbit-script (python version)](./build/hobbit-script.py?cgi-input-py=degrassi).
# 5. Run the script [Hobbit-script (bash version)](./build/hobbit-script.sh?foo=barzork).
# 6. Look in the [build](build/) directory.
# 5. Read the news at [CBC News](https://www.cbc.ca/news)
# 6. Clean up
#     - [Clean](clean)


.PHONY: clean update scripts

update: build/action0.txt build/action1.txt build/action2.txt scripts

scripts: build/excel.py build/elf-script.py build/balrog-script.py build/hobbit-script.py build/hobbit-script.sh orc-script.py

build/action0.txt: | build
	#./countdown 60
	#echo "sleeping for 60 seconds ..."
	#./countdown 360
	#cat foof
	date > build/action0.txt

build/action1.txt: build/action0.txt | build
	#countdown 21
	date > build/action1.txt

build/action2.txt: build/action1.txt | build
	countdown 22
	date > build/action2.txt

build/index.html: | build
	echo "<html><h1>Hello!</h1></html>" > build/index.html

orc-script.py:
	chmod u+x orc-script.py

build/hobbit-script.py: hobbit-script.py | build
	cp hobbit-script.py build/
	chmod u+x build/hobbit-script.py

build/elf-script.py: elf-script.py | build
	cp elf-script.py build/
	chmod u+x build/elf-script.py

build/balrog-script.py: balrog-script.py | build
	cp balrog-script.py build/
	chmod u+x build/balrog-script.py

build/excel.py: excel.py | build
	cp excel.py build/
	chmod u+x build/excel.py

build/hobbit-script.sh: hobbit-script.sh | build
	cp hobbit-script.sh build/
	chmod u+x build/hobbit-script.sh

build:
	mkdir -p $@

clean:
	rm -Rf build
