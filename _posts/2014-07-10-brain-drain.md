---
title: Miscellaneous Thoughts on the Academic STEM Brain Drain or, How I Learned to Stop Worrying and Leave The Lab
date: 2014-07-10
layout: post
published: True
---

[Many][1] [smart][2] [people][3] have written pieces related to the academic brain drain. Please read the originals but they boil down to these ideas:

* "Big Science" requires computational skills more lucratively rewarded in industry.
* The current (read: abysmal, with no signs of improvement) funding situation requires scientists to devote an increasing proportion of their time to secure funding. Scientists get up in the morning hoping to explain the world, not write grants.

Having spent the better part of a decade in some kind of academic research role and with tomorrow my last day at Vanderbilt, here are some ([required?][4]) thoughts about the brain drain.

### Engineering is not Science

My past research interests, especially neuroimaging, are computationally intensive. Not only are data storage and compute time for analyses high but the need to verify the computer is doing what you think (and publish!) is vital. This last part translates to writing both well-architected & correct software for analysis. This requires building codebases not at all once but rather through a controlled, deliberate and iterative fashion. Eventually people working in the computing-oriented sciences quickly have a solid if not expert knowledge of modern computing systems from the OS up through their application layers.

This process of software engineering has become ever more fascinating to me. In an effort to produce both state-of-the-art and reproducible scienctific workflows, I'm continually searching for resources in the hope of applying sound software engineering principles to the generation of good science. However, deliberately engineering good science is not the same as scientific output and that output alone is the differentiator between a successful academic scientist and a struggling grad student/adjunct faculty member.

Increasingly, universities care about the securing of funding (in no small part to pay for explosive otherwise-unrelated-to-research staff growth) and funding is generally routed to the testing of new hypotheses, not engineering better infrastructure to more efficiently run current projects.

[Refactoring][], [unit-testing][] and [version-control][], pillars of professional software engineering, have little place in an environment where only results and not the *maintainability* of those results matter. I not only agree that computational skills nurtured in science education are more lucratively rewarded in industry, but that **academia is a caustic environment to improve one's software engineering ability**.  If you're an engineer rather than scientist at heart, academia is a tough place to practice your trade.

### Academic Classism

There is a very real class war in academia penalizing those who forego the traditional undergrad-grad school-postdoc-tenure track faculty path. To a fault, I tend to get bored easily (see my desire above to constantly make existing things better) and I am positive that if I entered a Ph.D. program (assuming I could find one enough appealing), after five years I would have 3-4 mostly-finished projects and none on their own would lead to a dissertation.

The successful completion of a Ph.D. requires hard work, perseverance and tenacity; I'm not complaining about that. My beef lies in the bias of Ph.D's awarded to people who put their head down for 5 years and think about nothing else than their dissertation. I am not that person (especially now that I have a family) and I don't think the skills required to complete a Ph.D. are necessarily required to be a good scientist. There is overlap but many good (or would-be) scientists don't have the mindset to complete a Ph.D.

Herein lies the issue—in the university setting, people without a Ph.D. carry little to no political capital. They cannot run departments, hold tenure or execute their own research program. Perhaps the skills to successfully command these posts are fostered during Ph.D. work (I wouldn't know). Without your Ph.D. you can't be faculty and that makes you less useful in the eyes of the university because it's much more difficult to generate income without a research or clinical program of your own. The staff designation places an upper bound on both career trajectory and compensation.

I find common threads between this and [the disheartening trend of meritocracy in tech][5]. As a white male of privilege, in no way do I intend to diminish the struggle minorities face in STEM but it's not difficult to find analogies in the implicit biases generated within both the tech and academic communities. Both operate under the auspices of "the cream will rise to the top" without considering the diversity, makeup and ingredients of the cream.

### Random Thoughts

I couldn't congeal these into a narrative (not that there's an underlying theme above!) and so in no particular order:

* Universities face multiple, overlapping [leaky pipelines][6] due to many disparate internal and external forces.
* Academia undervalues engineering talent. Said talent should no longer be afraid to leave academic jobs whose main advantage has always been stability. Current funding situations have removed or diminished this advantage.
* Extremely smart people work in academia but university hiring practices (especially concerning little to no remote workforce) may diminish the chance for like-minded coworkers. I worked with brilliant people at all levels in Vanderbilt but very often felt like an orphan given my interests.
* The need to write off capital depreciation for tax purposes may produce suboptimal computing environments in universities. I would much rather have deployed my bigger applications to EC2/Heroku/etc. but computing resources have to be spent on **hard**ware. The need to own the hardware is silly.
* Intellectual Property rights for staff at universities are generally not good. In particular, Vanderbilt considers books, papers & art to be  owned by the creator while software and technology is owned by the institution. I'd love to hear a lawyer explain the difference with a straight face.
* At least at Vanderbilt, faculty are given nearly a day a week to consult on external projects without university interference. Any and all external collaborations I worked on were negotiated through the institution with no addition to my bottom line.

Universities will hold a monopoly on interesting ideas for the near future, at least until those ideas become profitable. The need to better improve myself became too great and the call to a new line of work too loud.

<!--links-->

[1]: http://jakevdp.github.io/blog/2013/10/26/big-data-brain-drain/
[2]: http://andy.terrel.us/blog/2013/11/21/joining-big-data-brain-drain/
[3]: http://anothersb.blogspot.com/2014/02/goodbye-academia.html
[4]: http://twitter.com/fonnesbeck/status/473587937763135488
[5]: http://www.npr.org/blogs/alltechconsidered/2014/02/06/272646267/how-the-meritocracy-myth-affects-women-in-technology
[6]: http://en.m.wikipedia.org/wiki/Women_in_STEM_fields#Leaky_pipeline
[Refactoring]: http://en.wikipedia.org/wiki/Code_refactoring
[unit-testing]: http://en.wikipedia.org/wiki/Unit-testing
[version-control]: http://en.wikipedia.org/wiki/Version_control
