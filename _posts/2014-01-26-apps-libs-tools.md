---
title: Tools, Libraries & Applications
date: 2014-01-26
layout: post
published: True
---

By training, I'm not a software engineer. I'm willing to bet the majority of those who develop software to produce science weren't trained as such either, which is why [Software Carpentry][1] is so important.

At its core, we produce science by applying one or methods against one or more datasets. The exact methods and datasets depend on the field and its current best practices. One can develop their own methods or use freely available tools. Vice versa, one might collect their own data or use publicly-available datasets. Either way, science needs a method and data to apply it against. We then can make inferences about the world.

Typically, if you're developing methods for others to use, you'll test your tool(s) against a public dataset so your results can be compared with other, similar methods. If you're collecting your own data (perhaps from a unique population), you'll probably want to use a public toolchain for analysis. Any variance in the results should be wholly attributable to the collected data and not the toolset.

There is a relationship between our tools and data and the better we understand this, the more reliable and reproducible our analyses become. I think this relationship takes the form of a [stack][10]. At the bottom of the stack, we have low-level tools that do the nitty gritty work. We may abstract these tools into libraries so they can more easily be used both alone and together. Finally, we produce applications built upon common, shared libraries that ask specific questions using specific data.

The following should be obvious to any professional developer. I'll use examples from neuroimaging but this should generalize to all fields of science.

### Tools

Lots of fields have robust & mature toolsets for data analysis. In neuroimaging, some of these packages include [Freesurfer][2], [FSL][3] and [SPM][4]. Lots of energy and work have been poured into the tools these packages expose and they've been tested against a wide variety of datasets. No reviewer will scoff at the usage of any of these tools.

However, no one would call these packages cutting-edge. Researchers across the world are continually developing novel algorithms for image processing and statistical analyses and as these procedures mature, they too become dependable tools for the rest of the community to use.

However, none of these tools will produce results for a scientific paper in and of themselves. The minimum work to be done is to apply these tools against your dataset. This is always done by developing by an "application" that uses these tools.

### Applications

Applications are highly dependent on the researchers data, hypotheses and available computing infrastructure. They can be as simple as a single script that passes acquired data to tools. They can also become quite complex, integrating many sources of data to many paths for analyses. Either way, it's very hard to share applications across research groups because their requirements are so specific and tuned.

This isn't necessarily bad though. There is much knowledge to be gained in developing these applications and students should seek this exposure as much as possible. Building an application exposes one to how tools should be used as well as confirming the research questions meant to be addressed are being answered.

### Libraries

Especially within a research group, applications will often lean on the same or a similar set of tools. Libraries can play a useful layer between tools and applications. Libraries should expose tools in a common form such that disparate applications can independently use these tools to address specific research questions. These libraries serve to gather our accumulated knowledge of best practices for using a particular tool. This is a form of [Don't Repeat Yourself (DRY)][7], a powerful methodology for building software.

These libraries have two requirements. First, they should present a unified interface for building commands to execute tools. Each tool requires different data in different forms so these libraries should try and minimize the differences across tools and simplify the use of said tools.

More importantly, these libraries should make no decisions about how incoming data should be organized or how the generated commands are ultimately executed. These decisions are the discretion of the application layer. Not only does this make libraries more useful to separate research groups but also infintely more testable because they don't require any particular infrastructure when [unit testing][6].

As we develop better know-how about using particular tools, we should pour this knowledge into libraries, not applications. Walling off our improved logic into a single application means no other can reap the benefits. Instead, if we update our libraries with improved knowledge and maintain [backwards compatibility][9], all of the applications built upon the library can share the improvements.

### Abstraction

Implicit in the above discussion is the idea of [abstraction][8]. Tools abstract their advanced image processing algorithms. Libraries abstract the advanced knowledge of how best to use tools. Applications abstract the all of the above so we can quickly apply methods against our particular dataset and ultimately answer questions about the world.

No layer is more important than the other. As research software engineers, we should be interested in all layers and keep in mind how changing any particular layer will affect the others. Only when we understand the relationship between our tools, libraries and applications can we begin to engineer better science.


[1]:    http://software-carpentry.org
[2]:    http://surfer.nmr.mgh.harvard.edu
[3]:    http://fsl.fmrib.ox.ac.uk/fsl/fslwiki/
[4]:    http://www.fil.ion.ucl.ac.uk/spm/
[5]:    http://cmic.cs.ucl.ac.uk/camino/index.php?n=Main.HomePage
[6]:    http://en.wikipedia.org/wiki/Unit_testing
[7]:    http://en.wikipedia.org/wiki/Don't_repeat_yourself
[8]:    http://en.wikipedia.org/wiki/Abstraction_(computer_science)
[9]:    http://en.wikipedia.org/wiki/Backwards_compatibility
[10]:   http://en.wikipedia.org/wiki/Solution_stack