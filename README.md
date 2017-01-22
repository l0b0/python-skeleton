Python skeleton
===

[![Build Status](https://travis-ci.org/l0b0/python-skeleton.svg)](https://travis-ci.org/l0b0/python-skeleton)

How to use for your own project:

1. Clone it to a new directory:

        git clone --recursive git@github.com:l0b0/python-skeleton.git your-project-name
        cd your-project-name
1. Make the project your own:

        origin=your_origin
        project=your_project_name
        sed --in-place "s#git@github.com:l0b0/python-skeleton.git#${origin}#" .git/config
        sed --in-place "s/python_skeleton/${project}/g" tests/test_python_skeleton.py
        git mv python_skeleton/python_skeleton.py "python_skeleton/${project}.py"
        git mv python_skeleton "$project"
        git mv tests/test_python_skeleton.py "tests/test_${project}.py"
1. If you're using IDEA, replace the references in the configuration:

        sed --in-place "s/python-skeleton/${project//_/-}/g;s/python_skeleton/${project}/g" .idea/*.{i,x}ml
        git mv .idea/python_skeleton.iml ".idea/${project}.iml"
1. See [`configuration.mk`](configuration.mk) for build options

Test
---

    make test

You can also test with a specific version of Python:

    make PYTHON_VERSION=2.7.11 test
