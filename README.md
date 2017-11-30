Python skeleton [![Build Status](https://travis-ci.org/l0b0/python-skeleton.svg)](https://travis-ci.org/l0b0/python-skeleton)
===

Boilerplate for a Python project with built-in testing:

- Unit tested
- 100% coverage
- Mock use example
- PEP8 validated
- Builds successfully with Python 2.6 through 3.6 and PyPy 2 + 3
- Travis CI integration
- IntelliJ IDEA integration

Use
---

1. Clone it to a new directory:

        git clone --recursive git@github.com:l0b0/python-skeleton.git your-project-name
        cd your-project-name
1. Make the project your own:

        origin=your_origin
        project=your_project_name
        sed --in-place "s#git@github.com:l0b0/python-skeleton.git#${origin}#" .git/config
        sed --in-place "s/python_skeleton/${project}/g" tests/test_python_skeleton.py .travis.yml Dockerfile
        git mv python_skeleton/python_skeleton.py "python_skeleton/${project}.py"
        git mv python_skeleton "$project"
        git mv tests/test_python_skeleton.py "tests/test_${project}.py"
1. See [`configuration.mk`](configuration.mk) for build options

Travis CI specifics:

- After setting up you'll need to modify the URL at the top of this file to point to your build status
- Modify [.travis.yml](.travis.yml) if you want to test with a different set of Python versions

IntelliJ IDEA specifics:

- If you're using IDEA, replace the references in the configuration:

        sed --in-place "s/python-skeleton/${project//_/-}/g;s/python_skeleton/${project}/g" .idea/*.{i,x}ml
        git mv .idea/python_skeleton.iml ".idea/${project}.iml"
    if not, simply delete the configuration:

        git rm -r .idea
- Make sure to run `make test-dependencies` before using the included test target.

Test
---

    make test

You can also test with a specific version of Python:

    make PYTHON_VERSION=2.7.11 test
