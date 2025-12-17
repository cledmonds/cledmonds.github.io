---
layout: page
permalink: /publications/
title: Publications
description:
years: [2026, 2025, 2024, 2023, 2022, 2021, 2020]
nav: true
nav_order: 3
---

My publications are listed in reverse chronological order below. They are categorised via <a href="#pubs">peer-reviewed publications</a>, <a href="#workshops">Workshop papers</a>, <a href="#afp"> Isabelle AFP Entries</a> (i.e. Archive of Formal Proofs), and <a href="#theses">Theses</a>.

<!-- _pages/publications.md -->

<div class="publications">

  <h2 class="pub-type"><a name="pubs">Published Papers</a></h2>
  {%- for y in page.years -%}
    {%- bibliography -f papers -q @*[year={{y}}]* -%}
  {%- endfor -%}

  <h2 class="pub-type"><a name="workshops">Workshop Papers</a></h2>
  {%- for y in page.years -%}
    {%- bibliography -f workshops -q @*[year={{y}}]* -%}
  {%- endfor -%}

  <h2 class="pub-type"><a name="afp">AFP Entries</a></h2>
  {%- for y in page.years -%}
    {%- bibliography -f afp -q @*[year={{y}}]* -%}
  {% endfor %}

  <h2 class="pub-type"><a name="theses">Theses</a></h2>
  {%- for y in page.years -%}
    {%- bibliography -f phd -q @*[year={{y}}]* -%}
  {%- endfor -%}

</div>
