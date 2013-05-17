---
title: Hell is Other People's Spreadsheets
date: 2013-01-21
layout: post
---

When I started at [EBRL](http://kc.vanderbilt.edu/educationandbrainlab/ "Education and Brain Research Lab"), we had begun slowly moving to capturing and recording all subject data in [various REDCap projects](http://project-redcap.org "Project REDCap"). REDCap is web-based data capture system created by the [Vanderbilt Institute for Clinical and Translational Research](https://victr.vanderbilt.edu/pub/ "VICTR"). Briefly, REDCap allows clinical and scientific groups to build, operate and use databases all through a web application. Without REDCap, these types of groups have either captured data in difficult-to-maintain spreadsheets or hire/outsource the development and admnistration of a database system. Both alternatives are frought with danger (especially when capturing personal health information (PHI)) and specifically for our lab, moving to REDCap was advantageous for the following reasons:

- No more emailing spreadsheets (especially those containing PHI).
- One and only one place to monitor subject status.
- One and only one place from which to start analyses.
- No more emailing spreadsheets.

Slowly but surely, we've created enough databases such that no data captured in our lab is canonically stored in a spreadsheet. Our data is more safe, more accessible, and more pliable in that REDCap can export formats understood by many statistical packages.

These advantages only scratch the surface of what putting our data in REDCap meant. Because REDCap exposes an Application Programming Interface (API) for exporting and importing data, it doesn't take much to realize that we could automate some of the more tedious and error-prone data workflows.

In future posts I will expound upon some of the technology and infrastructure I've developed for the lab, how it relates to REDCap, and ultimately how it has enabled us to produce more reliable and better science.

**Take home message**: From our perspective, if data is not in a globally and programmatically accessible place, it might as well not exist.