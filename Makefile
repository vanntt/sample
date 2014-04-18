REPORTER=spec

clean:
	rm -rf target/*
	rm -rf coverage
	rm -rf test/*.js

test:
	coffeelint src/* test/*.coffee && coffee -o target/ -c src/ && coffee -c test/*.coffee && istanbul cover _mocha test -- --reporter $(REPORTER)

.PHONY: test clean
