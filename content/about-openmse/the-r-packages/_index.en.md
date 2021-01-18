---
date: "2020-12-16T15:18:01+06:00"
title: The R Packages
weight: 1
keywords:
  - DLMtool
  - MSEtool
  - SAMtool
  - openMSE
---



<table>
 <tr>
    <td width="120"> <a href="#openMSE"> <img src="/images/OpenMSE.png" > </a></td>
    <td> openMSE is an umbrella package that contains the three core packages for constructing operating models and simulating fishery dynamics (MSEtool), applying data-limited management procedures (DLMtool), and conditioning operating models with data and applying more data-intensive assessment methods (SAMtool).
    </td>
 </tr>
</table>

<a href="/about-openmse/prerequisites/#installing-the-packages">Installing and loading</a> the `openMSE` package will all functions in the `openMSE` universe available in the R session.



#### Component Packages

<table>
 <tr>
    <td width="120"> <a href="#MSEtool"> <img src="/images/MSEtool.png" > </a></td>
    <td> The Management Strategy Evaluation toolkit
    <a href="#MSEtool">(MSEtool)</a> is the core package in the openMSE collection. It contains all the core functions for constructing operating models, simulating fishery dynamics, and evaluating the effectiveness of alternative management strategies. You can learn more about the specific functions in the MSEtool package at the <a href="#MSEtool">MSEtool documentation site</a>.
    </td>
 </tr>
 <tr>
    <td> <a href="https://blue-matter.github.io/DLMtool/"> <img src="/images/DLMtool.png" width="100"> </a></td>
    <td> The Data-Limited Methods toolkit 
    <a href="https://blue-matter.github.io/DLMtool/">(DLMtool)</a> is a collection of data-limited management procedures that have been developed for applications where it is not possible (or not desirable) to apply more conventional data-intensive assessment methods. You can learn more about the specific functions in the DLMtool package at the <a href="https://blue-matter.github.io/DLMtool/">DLMtool documentation site</a>.
    </td>
 </tr>
 <tr>
    <td> <a href="#SAMtool"> <img src="/images/SAMtool.png" width="100"> </a></td>
    <td> The Stock Assessment Methods toolkit 
    <a href="#SAMtool">(SAMtool)</a> is a collection of more data-intensive stock assessment methods and models for conditioning operating models with fishery data. You can learn more about the specific functions in the SAMtool package at the <a href="#SAMtool">SAMtool documentation site</a>.
    </td>
 </tr>
</table>








<!--
<script>
$(document).ready(function(){
    $('img[usemap]').rwdImageMaps();
});
</script>

<div>
<img src="/images/PackageStructure.png" alt="" usemap="#Map" width="300" height="300" />
<map name="Map" id="Map">
    <area alt="" title="openMSE" href="#openMSE" shape="rect" coords="75,0,225,100" />
    <area alt="" title="DLMtool" href="#DLMtool" shape="rect" coords="0,100,138,200" />
    <area alt="" title="SAMtool" href="#SAMtool" shape="rect" coords="162,100,300,200" />
    <area alt="" title="MSEtool" href="#MSEtool" shape="rect" coords="75,200,225,300" />

</map>
</div>

--!>

