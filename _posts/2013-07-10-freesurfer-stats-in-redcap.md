---
title: Freesurfer Stats in REDCap
date: 2013-07-10
layout: post
---

[Freesurfer](http://surver.nmr.mgh.harvard.edu) is a fantastic software package for reconstructing the brain's cortical surface from a high resolution structural MR image. Just give it a T1-weighted image (where gray matter is gray, white matter white) and a day of processing time (depending on image quality) and it produces 3D meshes of the white and gray matter surfaces. Given these models, it can then do all sorts of fancy calculations like area and average cortical thickness of particular regions. It's a fantastic tool for researchers because manual delineation of the cortical surface requires expertise and is extremely time-intensive. It's not an option when you're collecting data from one or two subjects a day as we do in our lab.

The problem with Freesurfer is that it can be extremely verbose with the data it spits out. We want to put these statistics into our REDCap databases so we can better analyze them against the myriad of behavioral measures we collect. If you run Freesurfer and generate advanced labeling, it can produce upwards of 2700 measures per subject. It's simply untenable to make some poor RA copy/paste all of these values into REDCap.

So, to make this sort of thing easier, I wrote a little tool that parses and flattens the stats files into a simple python dictionary. Usage goes a little something like this:

{% highlight python %}
from recon_stats import Subject
s = Subject('SUBJECTID') # where SUBJECTID is an identifier for a subject living in SUBJECTS_DIR
s.get_measures()
data = s.upload_dict()

# Using my PyCap package, you can then import the data into a REDCap project

from redcap import Project
p = Project(URL, TOKEN)
data[p.def_field] = 'SUBJECTID'
response = p.import_records([data])
{% endhighlight %}

This isn't going to work until you've added the ~2650 fields to your REDCap data dictionary which is no task for the faint of heart. To make this a little more easier for everyone, I created a [REDCap Shared Library](http://www.project-redcap.org/library/) so anyone with a REDCap project can easily search for `Freesurfer Reconstruction Stats` and download it into their project's data dictionary. Doing will will create a `recon` form. I don't recommend viewing this form for any particular record in your project, REDCap takes quite a while to generate HTML for all 2655 fields :)

Check out [the repo on github](https://github.com/sburns/recon-stats). It's on my to-do list to put it up on PyPI. Until then you can `git clone` the repo to your local machine. Happy `recon-all` & REDCap'ing!