---
title: Packaging Best Practices
date: 2014-01-28
layout: post
published: True
---

You've got a brilliant idea you want to implement in software. Congratulations, ideas are energizing. You hope it'll be good enough that others will want to use it. You might even want others to contribute to your code and make it better. These are all laudable goals. Unfortunately, an idea is nothing without an implementation and an implementation is nothing without proper structure around it. Here are some simple steps you can take to produce better, more professional software.

I hope this guide is both timeless and language agnostic but I'll probably sprinkle in specific services & tools that I use to make my life easier.

### Packaging Best Practices

Starting a new package is always a good time to re-orient yourself with best practices for your particular language & environment. Packaging techniques seem to change every 2-3 years in the python world. Look to popular, well-designed packages as a guide for packaging. In the python world, [requests][11] is your best bet for an easy-to-understand package. I always look at it when starting a new package.

### Version control

This should go without saying, but [version control][7] is an absolute necessity. Consider it an infinite "undo" button. Modern VCS systems like [git][8] and [mercurial][9] make it dead-simple to create branches off your main codebase for new features, bug-fixes and places for experimentation without affecting "production" code.

Learn a VCS and use it. Personally I prefer git because of [GitHub][10] and the ability to commit without an internet connection (looking at you Subversion). Remember though that tools are just tools. Don't get lost in tribal wars.


### README-driven development

[README Driven Development][1] says to write your README first. If you're gung-ho about developing software for others to use, gather your thoughts about what problem(s) you're solving and how you expect your users to interact with your software.

Consider your README the initial specification you're trying to hit. Before there exists any code in your package, you can take the time to truly consider what you're trying to do. The more code you've written, the more difficult it is to about-face on any particular idea, goal, design or implementation.

### Setup testing infrastructure

Nobody gets into software development because [unit-][2] and [functional-testing][3] is fun. However, asking people to use un-tested software is careless, unprofessional and downright malevolent. Work hard to reduce the impediments to testing your code. Consider dumping your test command(s) into a [Makefile][4]. If your testing infrastructure requires separate packages, make it very easy to get those packages.

As an aside, [py.test][5] let's you generate a script that runs your tests. The script contains a copy of the py.test package and therefore contributors don't need to download & install py.test. Brilliant if you ask me.

#### Continuous Integration

[Continuous Integration (CI)][6] is the practice of merging development branches often to reduce integration hell. Unless we've tested the development branches, they shouldn't be considered correct or valid. Therefore try to setup some sort of continuous testing service. If your package is on GitHub, take the 5 minutes to write a `.travis.yml` file and setup the hooks to get pushed branches tested on [TravisCI][12].

### Documentation is king

It's a lie to think you're working alone on a software project. Six months from now you will have forgotten why you made a particular decision in some small function and you will be working with (hopefully not against :) a previous version of yourself at that point. Wouldn't it be nice to find the piece of documentation detailing that decision?

If you're working with others, documentation is an absolute necessity. Not only does it keep developers on the same page but also gives users some confidence that you care about your work enough to write about it. Writing prose about your software also invariably helps you form better ideas about why you're writing this software, who should use this software & what your users will want to get out of this package.

[Sphinx][14] is the go-to tool for writing documentation for python packages. Couple it with [ReadTheDocs][15], a service that automatically builds and hosts your documentation for open-source projects.

I have not found a better site devoted to documentation than [WriteTheDocs][13]. Read it and understand why documentation is so important to your software.

### Conclusions

I hope these tips will help someone write more professional code. I just started working on something new and thinking about developing a more complete, user-friendly package spurred this post. I should have more to say about my new package soon.


[1]:    http://tom.preston-werner.com/2010/08/23/readme-driven-development.html
[2]:    http://en.wikipedia.org/wiki/Unit_testing
[3]:    http://en.wikipedia.org/wiki/Functional_testing
[4]:    http://en.wikipedia.org/wiki/Make_(software)
[5]:    http://pytest.org/latest/
[6]:    http://en.wikipedia.org/wiki/Continuous_integration
[7]:    http://en.wikipedia.org/wiki/Revision_control
[8]:    http://git-scm.com
[9]:    http://mercurial.selenic.com
[10]:   https://github.com
[11]:   http://docs.python-requests.org/en/latest/
[12]:   https://travis-ci.org
[13]:   http://docs.writethedocs.org/en/latest/
[14]:   http://sphinx-doc.org
[15]:   https://readthedocs.org