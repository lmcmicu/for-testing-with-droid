### Workflow
#
# 1. Run [Update](update)
# 2. View the [Action0](build/action0.txt) file.
# 3. View the [Action1](build/action1.txt) file.
# 4. View the [Action2](build/action2.txt) file.
# 5. Read today's news at [CBC News](https://www.cbc.ca/news)
# 6. Clean up after yourself, man, what kind of place do you think this is?
#     - [Clean](clean)


.PHONY: clean update

update: build/action0.txt build/action1.txt build/action2.txt

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
