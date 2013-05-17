---
layout: default
---

All software I publish publically can be found on [my github](https://github.com/sburns). Here's a sample:

### [PyCap](http://sburns.github.io/PyCap)

PyCap is a python package I designed and maintain to communicate with REDCap projects through the HTTP API. It provides an easy way for external python applications to export and import data to and from REDCap projects. It is the basis for much of what I've managed to do at EBRL.

### [Red-Light](http://github.com/sburns/red-light)

The main REDCap web-app is good for the most part but doing ad-hoc searches against projects is terrible. I wrote a small web-app to expedite this process. It works against the REDCap API. There's a live instance at [Heroku](https://red-light.herokuapp.com).

### [Switchboard](https://github.com/sburns/switchboard)

A feature of REDCap, data entry triggers, send notifications to external websites when data is saved in a project. This can be used to make extremely powerful and advanced data workflows.

Because only one URL can be associated with a project, middleware is required if you want to implement more than one workflow for a project.

I wrote switchboard to do just that. It is a [Flask](http://flask.pocoo.org) blueprint that can be easily added to existing Flask apps.