---
title: Using Conda For Quicker Travis Builds
date: 2014-03-28
layout: post
published: True
---

*Update: This post was spurred by a [brief exchange on Twitter](https://twitter.com/scottsburns/status/444216195773120512) with Matt Davis ([@jiffyclub](https://twitter.com/jiffyclub)). Apologies for not attributing this originally.*

Like I've said in the [past]({% post_url 2014-01-28-packaging-best-practices %}), it's irresponsible to produce and share un-tested code. [Travis-CI](https://travis-ci.org) is a system that takes testing one step farther. They've setup an integration with Github such that when commits on any branch are pushed to your repository, Travis will pull the branch to one of their testing servers and execute a series of tests on your behalf. This is fantastic because:

1. Users don't have to take your word that this package is tested.
2. Potential contributors don't need to setup their own testing infrastructure. If they submit a pull-request, Travis will pick it up and test it. Github will display the result of the Travis test on the pull-request page. Both the maintainer (you) and the contributor know this submission passes tests. If it doesn't, discussions can ensue.
3. Because Travis always runs a test in a new environment, as a package owner you don't have to worry about false positives when testing locally, i.e. some particular aspect of your local setup biasing test results.

Travis uses a `.travis.yml` file in your repository to setup, run & teardown tests. Setup often involves installing one or more dependencies, running usually invokes a test-runner like [nose](https://nose.readthedocs.org/en/latest/) or [py.test](http://pytest.org/latest/) and teardown may include notification of test results through email or other channels. Travis has [lots of helpful documentation](http://docs.travis-ci.com/user/build-configuration/) about writing a good `.travis.yml` file.

Bedrock packages such as [numpy](http://www.numpy.org), [scipy](http://www.scipy.org) & [pandas](http://pandas.pydata.org) are the building blocks for many scientific and data analysis applications in python. For performance reasons, these packages often include C extensions meaning they either require compliation from source before using or be installed as a pre-built binary. `pip`, the go-to python package installer, does not install these packages as binaries. This is an issue if you're testing on Travis because while they build successfully on the platform, this process can take a long time relative to the time required to test your package.

Enter `conda`, a up-and-coming package manager from the folks at [Continuum Analytics](http://continuum.io). Continuum provides pre-built binaries of many scientific & data analysis packages. `conda` will, instead of downloading the source and building `pip`, download the pre-built binaries from Continuum's servers and simply move them into place. This makes for faster, more stable & deterministic builds of your go-to libraries.

How can you use `conda` on Travis? Here's an example `.travis.yml` for python:

```
language: python
python:
  - "2.7"
  - "3.3"
install:
  # Install conda
  - sudo pip install conda
  # install deps
  - sudo conda init
  - sudo conda update conda --yes
  - deps='pip numpy pandas requests nose numpydoc sphinx'
  - conda create -p $HOME/py --yes $deps "python=$TRAVIS_PYTHON_VERSION"
  - export PATH=$HOME/py/bin:$PATH
  # install your own package into the environment
  - python setup.py install
script:
- "nosetests -w test/ -v"
```

The `install` key defines a set of steps Travis will take to setup your testing environment. The steps above download, initialize & update `conda` and then create a conda environment in `$HOME/py` into which dependencies are installed (set in the `deps` variable). Finally, `python setup.py install` installs your package into the conda environment. After that, the steps defined in `script` are executed. Here, we're simply invoking `nosetests` to search for tests and execute them.

My Travis builds of [PyCap](http://pycap.rtfd.org) have gone from between 5-6 minutes to about 90 seconds on the same test battery simply by using `conda` to install numpy and pandas.

Because Travis is a shared resource, developers should try to optimize build time so Travis is testing our code and not wasting time building the same packages over & over again. If your software requires scipy, numpy, pandas or other bedrock packages, I highly recommend taking the time to change your testing process on Travis.
