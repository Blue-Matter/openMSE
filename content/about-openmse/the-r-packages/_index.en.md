---
date: "2021-01-19T11:35:01+06:00"
title: The R Packages
weight: 2
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
    <td width="120"> <a href="https://msetool.openMSE.com"> <img src="/images/MSEtool.png" > </a></td>
    <td> The Management Strategy Evaluation toolkit
    <a href="https://msetool.openMSE.com">(MSEtool)</a> is the core package in the openMSE collection. It contains all the core functions for constructing operating models, simulating fishery dynamics, and evaluating the effectiveness of alternative management strategies. You can learn more about the specific functions in the MSEtool package at the <a href="https://msetool.openMSE.com">MSEtool documentation site</a>.
    </td>
 </tr>
 <tr>
    <td> <a href="https://dlmtool.openMSE.com/"> <img src="/images/DLMtool.png" width="100"> </a></td>
    <td> The Data-Limited Methods toolkit 
    <a href="https://dlmtool.openMSE.com">(DLMtool)</a> is a collection of data-limited management procedures that have been developed for applications where it is not possible (or not desirable) to apply more conventional data-intensive assessment methods. You can learn more about the specific functions in the DLMtool package at the <a href="https://dlmtool.openMSE.com/">DLMtool documentation site</a>. DLMtool uses the MSEtool package as a dependency, and loading DLMtool will make all MSEtool functions available.
    </td>
 </tr>
 <tr>
    <td> <a href="https://samtool.openMSE.com"> <img src="/images/SAMtool.png" width="100"> </a></td>
    <td> The Stock Assessment Methods toolkit 
    <a href="https://samtool.openMSE.com">(SAMtool)</a> is a collection of more data-intensive stock assessment methods and models for conditioning operating models with fishery data. You can learn more about the specific functions in the SAMtool package at the <a href="https://samtool.openMSE.com">SAMtool documentation site</a>. SAMtool uses the MSEtool package as a dependency, and loading SAMtool will make all MSEtool functions available.
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

