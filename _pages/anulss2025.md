---
layout: page
permalink: /anulss2025/
title: ANU LSS 2025 - Proof Engineering for Program Logics in Isabelle/HOL
description: ANU LSS 2025 Course Page
nav: false
---

This is the course page for the 2025 ANU Logic Summer School course on *Proof Engineering for Program Logics in Isabelle/HOL*. This course will be part of the second week of lectures from the 8th to the 12th of December. For more information on the school, see the official [ANU LSS website](https://comp.anu.edu.au/lss/).

## Course Summary

Program logics enable us to formally reason on the correctness of a program, but on paper proofs can be complex or long, resulting in subtle errors. Formalising such proofs in a proof assistant offers a way to avoid this; however, in such a formal environment small design choices in a program logic definition can significantly impact the complexity of formal proofs. Thus “proof engineering” decisions play a critical role in managing this, as well as supporting the modularity and reusability of formal libraries.

This course will begin with an introduction to formal program semantics, before exploring several program logic definitions - focusing on Hoare logic for sequential programs and Rely-Guarantee logic for concurrent programs, including introducing a novel coinductive approach based on recent research. The theory will be introduced alongside defining and reasoning on these definitions in the Isabelle/HOL proof assistant, demonstrating the impact of proof engineering decisions. Building on the introductory Isabelle course, we’ll explore a number of more advanced features such as (co)inductive definitions and tactics, as well as locales (Isabelle’s module system), and gain hands-on experience in program verification using Isabelle.

## Lecture Plan

The lectures plan to cover the following topics 
- Lecture 1: Introduction to program semantics, and basic reasoning on programs in Isabelle/HOL
- Lecture 2: Program Logics: Hoare Logic, proof systems, soundness, and an intro to Rely-Guarantee Logic
- Lecture 3: An introduction to coinduction in Isabelle/HOL
- Lecture 4: Rely-guarantee reasoning semantics, proof engineering different definitions in Isabelle/HOL
- Lecture 5: Modularity in Isabelle/HOL - Locales, type classes, and program verification use cases. 

The schedule is available on the ANU LSS website.

## Course Resources

All students should pre-install Isabelle/HOL - see the [Isabelle website](https://isabelle.in.tum.de/).

The course materials (draft) are available below. More material will become available throughout the week - please check for updates. 

| Day | Lecture Notes   | Isabelle Theories| Solutions |
| --- | --------------- | ---------------- | ------------|
| Monday | <a href="../assets/pdf/lecture1_anu_lss.pdf"> Lecture 1</a> | <a href="../assets/code/lecture1_anu_lss.zip"> Isabelle 1 Zip</a>  | See lecture 2|
| Tuesday | <a href="../assets/pdf/lecture2_anu_lss.pdf"> Lecture 2</a> | <a href="../assets/code/lecture2_anu_lss.zip"> Isabelle 2 Zip</a> | |
| Wednesday | <a href="../assets/pdf/lecture3_anu_lss.pdf"> Lecture 3</a> | <a href="../assets/code/lecture3_anu_lss.zip"> Isabelle 3 Zip</a>  | |
| Thursday |  |  | |
| Friday |  |  | |

## Other Useful Resources

For more information on Isabelle/detail on different features, see:
- The Isabelle distribution comes with extensive documentation. In particular the prog-prove and locales/type classes tutorials may prove useful.
- For program verification, consider Nipkow and Klein's [Concrete Semantics](http://concrete-semantics.org/) book
- For history, interesting notes, and more detailed examples, the [Machine Logic blog](https://lawrencecpaulson.github.io/) by Larry Paulson may prove interesting.
- For more on induction and coinduction, with Isabelle/HOL examples, see Andrei Popescu's excellent [course notes](https://www.andreipopescu.uk/MGS2021/ISA_course.html).