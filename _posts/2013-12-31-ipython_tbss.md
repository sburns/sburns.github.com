---
date: 2013-12-31
title: TBSS & IPython.parallel
layout: post
published: true
---

### A brief primer on Diffusion Tensor Imaging

We collect a wide variety of MR data from our children. Along with a high-resolution T1 and functional MR, we also collect a high-angular resolution diffusion image (HARDI), which is a kind of diffusion tensor image (DTI) sequence.This type of MR sequence measures the relative motion of water at every voxel along a variety of gradients (directions) through the brain. The line of thinking goes that water molecules, during their random walk, are more likely to move parallel to axons than cross the myelin sheath. Therefore diffusion imaging is a way to get at structural connectivity because it (hopefully) reveals the white-matter pathways through the brain.

Much like functional MR, the math behind DTI is not complex. Simply put, we use the many collected images and known gradient direction for each image to solve for the tensor at every voxel. This tensor encapsulates both the direction water will most likely flow in that voxel as well as to the degree it will flow. For each direction (X, Y & Z), the tensor contains information about the relative component of the direction. The average of the X, Y and Z components is called Fractional Anisotropy (FA) and it varies between 0 and 1. For voxels that contain water moving in a very definite direction, FA is high and you might visualize it as a rod pointing in some particular direction. For areas of the brain in which water moves more equally in all three directions, FA is low. This typically occurs in gray matter where axons are much less organized than in white matter.

### Group modeling

We typically will examine FA maps and look for regions that covary with some behavioral measure. We collect all MR data in what is called subject or native space. In subject space, there is no relation between the actual brain region at any particular voxel in one subject and that same voxel in another subject. Because we collect data from many subjects for statistical power, we employ a method call registration to align every subject's native space FA image to a template. This template is often in a space that has been labeled with specific anatomical locations. Therefore, once we have all subjects in a template space and find regions that correlate with a behavioral measure, we can look up the anatomical location of that region and make a brilliant scientific conclusion (hopefully).

### Problems

FA maps are difficult to register to the template because white matter pathways vary widely between subjects and especially so if the subjects will as a whole have different white matter structure from the template. Our child data is very difficult to register to any particular template space.

[FSL](http://fsl.fmrib.ox.ac.uk/fsl/fslwiki/)'s [Tract-Based Spatial Statistics](http://fsl.fmrib.ox.ac.uk/fsl/fslwiki/TBSS) (TBSS) tool provides what some believe to be the best way to register many FA maps together. In a nutshell, it registers every subject to each other, discovers the most "prototypical" subject and aligns that subject to the template. Stacking the inter-subject registration and the template registrations, each image is brought into template space.

So, if we have 100 subjects, that's 100<sup>2</sup> or 10000 inter-subject registrations to perform. Each registration takes 3-5 minutes, so we're looking at ~20 days of compute time to do this. Fortunately, this problem is extremely parallelizable because no single registration depends on another. FSL provides a way to send this to a compute cluster. However, typical (especially shared) clusters perform better with long running tasks ( > 1 hr wall time) due to the overhead required in submitting and maintaining running processes on each compute node. Submitting 10000 5-minute jobs would swamp the scheduler and generate some very nasty emails from your cluster system administrator whom you shouldn't want to upset. We need some way to perform many jobs in parallel with less overhead than a full cluster.

### Solution

 Enter [IPython.parallel](http://ipython.org/ipython-doc/stable/parallel/index.html). IPython provides the architecture and machinery to start engines (processes that will accept work) on separate computers and then submit work from one or more other processes. This is better than python's [multiprocessing](http://docs.python.org/2/library/multiprocessing.html) library that parallelizes only across a single machine. If you only have a single machine at your disposal, I would absolutely use `multiprocessing`.

First, we need to preprocess our data. Assuming you're in a directory with all of your FA images:

{% highlight bash %}
$ tbss_1_preproc *.nii
{% endhighlight %}

This takes a few seconds per image. Next, we'll run TBSS's registration step. The `-n` option tells TBSS to run the inter-subject registration:

{% highlight bash %}
$ tbss_2_reg -n
{% endhighlight %}

If you let this run as is, you'll need to come back in 20 days. What `tbss_2_reg -n` first does is build a list of registrations to perform. It stores this in a text file at `FA/.commands`. If you keep running `tbss_2_reg`, it will simply begin executing these commands.

Instead, what I do is kill the `tbss_2_reg` command and jump into python. First, read the list of registration commands and define a function we'll use to execute a single command.

{% highlight python %}
with open('FA/.commands') as f:
    commands = [c for c in f.read().split() if c]

def execute(command):
    """ execute the command-line call given in `command`

    Note: imports should go in the function as imported
    modules are not global in the IPython cluster"""
    from subprocess import call
    from shlex import split

    parts = split(command)
    return call(parts)

{% endhighlight %}

At this point, we need to start up our "cluster". You should make a new parallel IPython profile for this. I won't dive into the details of configuring an IPython cluster [as the docs are quite good](http://ipython.org/ipython-doc/stable/parallel/parallel_process.html). Back in a shell, let's start our cluster:

{% highlight bash %}
$ screen -S cluster
...screen session...
$ ipcluster --profile-dir=/path/to/your/parallel/profile_dir
...output from ipcluster...
...Ctrl-A d to detach your terminal...
{% endhighlight %}

I'm a big fan of [screen](https://www.gnu.org/software/screen/) for long running processes. `ipcluster` is the easy way to start an IPython cluster but it needs to run for as long as you want to do work on that cluster. Simply backgrounding the command (`ipcluster ... &`) isn't enough as terminating a shell session with running jobs will kill the jobs (and your cluster). This method is also pretty explicit in that when you want to stop your cluster, just re-attach and kill the process. If you `nohup ipcluster ... &`, you'll have to hunt around in `top` to find the right IPython process to kill.

With the cluster up and running, back into python:

{% highlight python %}
from IPython.parallel import Client
c = Client(profile_dir='/path/to/your/parallel/profile_dir')
lview = c.load_balanced_view()
{% endhighlight %}

`len(c)` will be how many engines you have running in this cluster. The [load balanced view](http://ipython.org/ipython-doc/rel-1.1.0/parallel/parallel_task.html#the-ipython-task-interface) is the primary method you should use to submit jobs to your cluster.

{% highlight python %}
results = lview.map_async(execute, commands)
{% endhighlight %}

Much like python's built-in `map`, `lview.map_async` takes a function and an iterable of arguments to pass to that function. Behind the scenes, it does the hard work of submitting jobs to the IPython cluster and grabbing results. Because we're using the `.map_async` function, this will return very quickly. Rest assured, the engines are working very hard now.

### Caveats & Conclusions

This isn't the cleanest nor easiest-to-setup method to parallelize TBSS. However, I've found IPython's parallel machinery to be bullet-proof and provide the right level of control when I need to run lots of little jobs. This method is definitely overkill if you have a single machine to do work on and like I said, definitely use `multiprocessing` (or better, [joblib](https://github.com/joblib/joblib), a great wrapper around multiprocessing).

I think this is a great example of just how much IPython can help in your work. If the [notebook](http://ipython.org/ipython-doc/stable/interactive/notebook.html) feature sold you on IPython, the parallel tools are just icing on the cake.