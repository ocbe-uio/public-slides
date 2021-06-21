
<!--
_class: title
_footer: UiO
-->

# Ten simple rules for quick and dirty scientific programming

Monday morning OCBE coffee break hijack
Waldir Leôncio Netto
2021-06-21

---

# Paper authors

- Balaban, Gabriel (UiO)
- Grytten, Ivar (UiO)
- Rand, Knut (OUS)
- Scheffer, Lonneke (UiO)
- Sandve, Kjetil (UiO)

# Publication

- Open Access
- PLOS Computational Biology
- https://doi.org/10.1371/journal.pcbi.1008549
- March 11, 2021

---

# The 10 rules

![bg brightness:0.5 110%](https://i.ytimg.com/vi/06dKRdhDT78/maxresdefault.jpg)

1) Think before you code
2) Start with prototypes and expand them in short development cycles
3) Look for opportunities for code reuse
4) Modularize your code
5) Avoid premature optimization
6) Use automated unit testing for critical components
7) Refactor frequenty
8) Write self-documenting code for programmers and a readme file for users
9) Grow your libraries and tools organically from your research
10) Go explore and be rigorous when you publish

---

# "Quick and WHAT?" :flushed:

1) Sloppy coding → bugs → false conclusions → article retraction :skull:
2) So be *quick, but rigorous*!
3) **Quick and dirty = good enough with minimal effort**

---

# Some observations about the 10 rules

## 1. Think before you code

- Spend a bit of time planning, scribbling, daydreaming
- Define your MVP before anything else (more on [rule 2](#6))
- Don't overthink it, though (more on [rule 4](#8))

---

## 2. Start with prototypes and expand them in short development cycles

- Do the simplest thing that could possibly work
- MVP: the smallest program (in terms of features) needed to test your _key project assumptions_. (from [rule 1](#5))
  - Do that ASAP...
  * and stick to it!
- Short development cycles
- Releasing feels good
- Don't get stuck in beta (version 0.whatever) limbo
- Implement Continuous Integration practices (i.e. hide unripe code)

---

## 3. Look for opportunities for code reuse

- Start with a _prototype_ (minimum funcionality, avoid speculative features)
- Consider reinventing the wheel _vs_ reusing _popular_ existing code

| Category                       |     Reinvent      |       Reuse       |
| :----------------------------- | :---------------: | :---------------: |
| Coding time                    |                   | :1st_place_medal: |
| Probability of maintenance     |                   | :1st_place_medal: |
| Code length                    | :1st_place_medal: |                   |
| Code independence              | :1st_place_medal: |                   |
| Code speed (for [rule 5](#9)) | :1st_place_medal: | :1st_place_medal: |

---

## 4. Modularize your code

* Be DRY (Don't Repeat Yourself), not WET (Write Every Time)
* Signs that your code needs to be broken down:
  - One line has more than 80 characters
  - You can't see your whole function/script without scrolling
* Keep it short and narrow, either immediately or when refactoring ([rule 7](#11))
* Add functions and classes as you needed instead of designing _a priori_ (conflict with [rule 1](#5)?)
* Can there be too much modularization (see [rule 7](#11))?

---

## 5. Avoid premature optimization

1) Best alternative to code optimization: **reduce the size of the computation/data**
   1. Working with large datasets? Subsample or replace during development.
   2. Avoid creating several similar copies of the same dataset (esp. a large one)
2) Don't babysit your computer
   1. Run long things on a server (ideally, over the weekend)
   2. Find something else to do in the meantime
   3. Remember: your time is more valuable than your computer's!
3) Profile your program
   1. Remember the **Pareto principle** and focus on the bottlenecks
   2. Some algorithms only become inefficient with a big dataset
4) Consider replacing (see [rule 3](#7)) or rewriting some code in a lower-level language

---

## 6. Use automated unit testing for critical components

* "More than the act oftesting, the act of **designing tests is one of the best bug preventers** known" (Boris Beizer)
* Fix seed values to avoid randomness in unit test results
* Focus on critical parts (don't try to make it completely foolproof)
  - Critical: code which might produce errors with scientific consequences (ex.: miscalculation of a _p_-value)
  - Non-critical: odd and relatively harmless errors (ex.: misaligned output in some cases)
* Unit tests are not just for packages!

---

## 7. Refactor frequently

* Refactoring: software changes that do not alter its external behavior yet improves its internal structure
* Your future self and your collaborators will thank you for writing pretty code
* Refactoring can save you from debugging
* Frequently check for "code smells"

### Code smells

* Duplicated code
* Long functions
* Long parameter lists (don't get users lost in a sea of options they might never use)
* Need to change the same thing on multiple places (too much modularization?)

---

### Small and easy refactoring

* Give variables better names
  - Not super long, but still descriptive
    - 1-letter names are dangerously generic (OK for Math equations, though)
    - 20-letter names take too much horizontal space
  - Replace literal numbers with constants (ex. `e` instead of `2.718`)
* Eliminate need for a global variable (if functions can easily calculate them)
* Modularize code ([rule 4](#8))
  - Duplicated code might become a function
  - Long functions might become several
* Group related functions into classes
* Reorganize functions and classes into appropriate files

---

## 8. Write self-documenting code for programmers and a readme file for users

* Early stages: stick to code-level comments
  - Too many changes to bother with writing help files and vignettes
  - **Comment the "why", the "how". Not the "what"**
* Make the code more readable
  - Use meaningful variable names (see [rule 7](#12))
  - Explicitly name constants (see [rule 7](#12))
  - Use verbs as function names
  - Prefix boolean variables with `is`
  - Coding equations: add the reference!
---

## 9. Grow your libraries and tools organically from your research

- Modularize ([rule 4](#8)) and categorize your code
- **Prefer CLIs to GUIs (simpler, more stable, scriptable)**

### Three categories of code

1) Project code
   1. Addresses a specific research question
2) Library code
   1. Reusable components for ongoing and future projects
   2. Code for generic, common tasks/grunt work (data handling, preprocessing)
   3. Don't plan ahead: organically grow your library from projects
3) External tools
   1. Other software with interfaces for other tasks (task automation, integration)

---

## 10. Go explore and be rigorous when you publish

* Be quick and dirty in the early phases
* Ensure quality and reproducibility when you publish
  - Create a workflow (e.g. script) that reproduces all your publishable results:
    - Bash
    - Jupyter
    - Rmarkdown
    - NextFlow
    - Snakemake
  - Do this after you're done exploring the data and drawing your conclusions
