TESTS = test/*.spec.js

test:
	@NODE_ENV=test ./node_modules/.bin/mocha --reporter spec $(TESTS)

test-coveralls:
	@NODE_ENV=test ./node_modules/.bin/istanbul cover \
	./node_modules/mocha/bin/_mocha --report lcovonly -- -R spec && \
		cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js --verbose

.PHONY: test