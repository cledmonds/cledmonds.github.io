---
layout: page
permalink: /publications/
title: Publications
description: Publications in categories and reversed chronological order.
years: [2024, 2023, 2022, 2021, 2020]
nav: true
nav_order: 3
---

<!-- _pages/publications.md -->

<!-- Bibsearch Feature -->

{% include bib_search.liquid %}

<div class="publications">

  <h2 class="pub-type">Published Papers</h2>
  {%- for y in page.years -%}
    {%- bibliography -f papers -q @*[year={{y}}]* -%}
  {%- endfor -%}

  <h2 class="pub-type">AFP Entries</h2>
  {%- for y in page.years -%}
    {%- bibliography -f afp -q @*[year={{y}}]* -%}
  {% endfor %}

</div>
