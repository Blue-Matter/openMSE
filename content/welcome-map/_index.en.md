--- 
date: "2021-01-21T11:35:01+06:00" 
description: How the components fit together
icon: far fa-map-marked-alt
title: openMSE Map
type: welcome 
weight: 3 
---


<div class=col-9>

The `openMSE` packages use an object-oriented design. In essence this means that most functions take objects with an openMSE-specific class as arguments (e.g., `OM`) and return other objects with an openMSE-specific class (e.g., `MSE`). 

You can learn more about [object-oriented design](https://adv-r.hadley.nz/oo.html), although this isn't required to use `openMSE`. 

More important, is an understanding how the various [openMSE objects](/#objects) relate together. This diagram shows how the various parts connect together. 

The colors indicate:

1. yellow - openMSE objects

2. green - openMSE functions that operate on the openMSE objects

3. blue - features of the openMSE framework.


Clicking on various parts of the diagram will take you to the relevant pages that explain the objects, functions, and features in more detail. 

</div>
<hr>

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers lightbox&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2021-01-22T17:21:53.580Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36\&quot; etag=\&quot;H3uL11pregBfzk6fCODo\&quot; version=\&quot;14.2.6\&quot; type=\&quot;google\&quot;&gt;&lt;diagram id=\&quot;aBsqhW0-vO5jqpX240pv\&quot; name=\&quot;Page-1\&quot;&gt;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&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>

<hr>

