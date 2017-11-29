NAME = $(notdir $(CURDIR))
PACKAGE_NAME = $(subst -,_,$(NAME))

.PHONY: all
all: build

.PHONY: test
test:
	docker build --network host --tag=$(PACKAGE_NAME) --build-arg=PACKAGE=$(PACKAGE_NAME) .
	docker run --rm $(PACKAGE_NAME) /venv/bin/pep8 --max-line-length=120 .
	docker run --rm $(PACKAGE_NAME) /bin/bash -c "/venv/bin/coverage run setup.py test && /venv/bin/coverage report --include='./$(PACKAGE_NAME)/*' --fail-under=100"

.PHONY: test-clean
test-clean:
	# Run after `make clean`
	test -z "$$($(GIT) clean --dry-run -dx)"

.PHONY: build
build: test virtualenv
	mkdir -p $@
	. virtualenv/bin/activate && \
		python setup.py build

.PHONY: install
install: virtualenv
	$(SYSTEM_PYTHON) setup.py install $(INSTALL_OPTIONS)

.PHONY: clean
clean: clean-build clean-test
	make METHOD=git sort-xml-files

.PHONY: clean-build
clean-build: clean-build-third-party clean-build-local

.PHONY: clean-build-third-party
clean-build-third-party:
	-$(RM) -r build

.PHONY: clean-build-local
clean-build-local:
	-$(RM) -r $(PACKAGE_NAME).egg-info
	-$(FIND) . -type d -name '__pycache__' -exec $(RM) -r {} +
	-$(FIND) . -type f -name '*.pyc' -delete

.PHONY: clean-test
clean-test:
	-$(RM) virtualenv

include configuration.mk
include make-includes/python.mk
include make-includes/variables.mk
include make-includes/xml.mk
