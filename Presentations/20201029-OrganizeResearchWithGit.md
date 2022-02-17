🎬 Are you more in a watching than a reading mood right now? This content is also available on YouTube: https://youtu.be/JJhx7gAm5ec

# Organize your research and teaching material<br>  with Git (and <img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/R.png" height=40>, or whatever floats your boat)

<!--
I know this is an R group, but I wanna highlight the fact that sometimes you're on a
work project that doesn't involve R. You can still (and probably should!) use Git in those cases.
-->

**Waldir Leôncio Netto**

Scientific programmer
Oslo Centre for Biostatistics and Epidemiology ([OCBE](https://www.med.uio.no/imb/english/research/centres/ocbe/))
<img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/GitHub-Mark-120px-plus.png" height=20> [ocbe-uio](https://github.com/ocbe-uio) <img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/GitHub-Mark-120px-plus.png" height=20> [wleoncio](https://github.com/wleoncio)

---

<!-- Setting some ground rules -->

# First, let's get _sooo_ meta

## About the slides
:globe_with_meridians: Will be made available on <img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/GitHub-Mark-Light-120px-plus.png" height=30> [ocbe-uio/public-slides](https://github.com/ocbe-uio/public-slides)
:scroll: Licensed under <img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/sa.xlarge.png" height=30>

## About this presentation

:interrobang:  Feel free to interrupt me with questions or comments at any time!
<b class="dimmer">Remember Zoom's Chat is bad at letting the presenter know if someone asked them something.</b>
:speech_balloon: I might post some stuff on Chat (mainly links)
:computer: If you haven't installed Git on your computer yet, this might be your last chance: https://git-scm.com/download/

<!--
If for whatever reason you can't install Git, you can still follow along.

This is more of a hands-on seminar than a workshop, so if you have any installation or usage issues,
we might not have time to help.
-->

---

<!--
_class: bigh1
-->

# What Git is and what it isn't

---

<!-- This reminds me of school. -->

"The Merriam-Webster dictionary defines 'git' as..."

<img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/gitDefinition.png" height=600> <img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/gitDefinition2.png" height=600>

<!--
If you know the creator, you know he has a bit of a peculiar sense of humor.
But now, seriously...
-->

---

## Git is

* A version-control system
* Created in 2005 by Linus Torvalds :finland: (of Linux fame)
* Maintained by Junio Hamano and others
* At the base of a reproducible workflow (Peikert and Brandmaier, 2020)
	- Rmarkdown :arrow_right: **Git** :arrow_right: Make :arrow_right: Docker
* Super good at handling pure-text files
	- R, Python, MATLAB, Stata files (data analysis scripts, packages, etc.)
	- Whatever you use to write documents (especially $\LaTeX$ and Markdown)
		- notes
		- papers
		- presentations

<!-- Thanks Henrik for pointing me to the Peikert article! -->

---

## Git is _not_

* Just for software developers
* A good place to dump
	- Large files (e.g. data)
	- Files that are generated from other files (e.g. a .pdf from a .tex or .rmd file)
	* GitHub may be an exception when used as a file-hosting page
* GitHub
	- Distributed workflows _are_ a Git feature
	- ...albeit a secondary one. Git's main job is version control
<img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/GitHub_Logo_White.png" height=100> <img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/Git-Logo-White.png" height=100>

<!--
Git makes copies of the whole file (instead of incremental changes),
unlike SVN and CVS
-->

---

# Installing Git (last chance, for real this time)

- General instructions: https://git-scm.com/download/
- <img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/linux.png" height=20> Linux
	- It usually comes pre-installed (verify by running `git --version`)
	- Otherwise, use your distro's package manager (apt, dnf, pacman...)
- <img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/apple.png" height=20> macOS
	- Open a terminal and type `git --version`
	- Plan B: install Xcode Command Line Tools
-  <img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/windows.png" height=20> Windows
	- Download and execute the file on https://git-scm.com/download/win

---

<!--
_color: white
-->
![bg blur:3px brightness:50%](../img/gitTerminal3.png)

# Git is primarily text-based software (just like <img src="https://github.com/ocbe-uio/public-slides/blob/main/Presentations/img/R.png" height=40>!)

:smiley: Perfect if you're looking for speed and/or use your keyboard a lot
:rage: Not great if you like to use your mouse and/or don't care about speed

...but even if you identify with latter category, you may love using Git!

---

# Graphical interfaces to Git

* [RStudio's built-in GUI](https://rstudio.com/)
	:smiley: Convenient if you only use RStudio
	:rage: Very limited and freeze-prone
* [VSCode's built-in GUI](https://vscodium.com/) + [Git Graph extension](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph) (+ [R](https://marketplace.visualstudio.com/items?itemName=Ikuyadeu.r))
	:smiley: Great if you work in many languages (R, C++, Markdown, $\TeX$) and/or _GitHub Codespaces_
	:rage: Bad handling of pulls and merge conflicts
	(without further extending)
* [GitKraken](https://www.gitkraken.com/)
	:smiley:  Very robust and featureful
	:rage: Adds another app to your workflow
	<b data-marpit-fragment> :ballot_box_with_check: Chosen tool for this talk (+ terminal)!	</b>

![bg right:30% fit vertical](../img/RStudio-Logo-White.png)
![bg fit](../img/vsc-alpha.png)
![bg fit](../img/gitkraken-logo-mono-light-hz.png)

<!--
Reasons to bring up VSC:
	1. I want to remind you RStudio is not the only one and not necessarily the best GUI for R
	2. Codespaces
Gitkraken + terminal: most universal solution (I think)
-->

---

# Git lingo, simplified

1) <b class="def">Repo(sitory)</b>: A collection of past and present versions of your working directory
	- Locally, a hidden `.git` folder in your working dir
	- _May_ also be hosted online (e.g. GitHub, GitLab, Bitbucket)
2) <b class="def">Commit</b>: One particular version/snapshot of your working directory
	- A repo is, at the top level, a collection of commits
	- Basic workflow behavior
		- Save (<kbd>Ctrl</kbd>+<kbd>S</kbd>) as much as you want between commits
		- Saves are ignored, only commits matter (unlike Dropbox)
3) <b class="def">Hash</b>: a 40-character unique alfanumeric identifier of a commit
	* a4508a3d857eg282aced33ba75d18ede34fde99f
	* a4508a<b class="dim">3d857eg282aced33ba75d18ede34fde99f</b>
	* Don't worry, you won't need to know them by heart

---

# Where on Git are your files?

1. <b class="def">Working directory</b>: you see the files in your file explorer
2. <b class="def">Staging area</b>: a temporary area where files are gathered and prepared for a commit
3. <b class="def">Repository</b>: after the commit, the files are moved from the staging into the repository for permanent storage

![bg invert right 100%](../img/staging.png)

---

<!-- _class: bigh1 -->

# One last thing before we start working

---

## Optimize your workspace to follow this workshop

![bg right:40% 80%](../img/screenOrg.png)

- **Slides** to follow the workshop instructions
- **Chat/notepad** to socialize and take notes
- **File explorer** to see what's going on with your files
- **Git**, which is the whole point of the workshop

<div class="greenbox" data-marpit-fragment>

:+1: No overlapping window mess
:+1: Front-row seats to all the action
</div>

<!--
- Dark theme optional
- Move your social media to another monitor or workspace
 -->

---

<!-- _class: bigh1 -->

# Basic Git Commands
(yes, we're _finally_ starting for good :tada:)

---

## Configuring your user info

```bash
git config --global user.name "(name)"
git config --global user.email "(e-mail)" # GitHub user? use your GH e-mail
```

## Initializing a repository

```bash
git init # within working directory
```

---

## Doing some actual work

1. First do some science

![](../img/science.gif)

2. Then commit―i.e. register on Git―a version of your science

```bash
git status
git add (file)
git commit -m "(message)"
git log
```

---

3. Go make more science

![](../img/moreScience.gif)

4. Realize what you have done

```bash
git status
git diff (file)
```

---

<!-- _class: bigh1 -->

# Taking it up a notch

---

## Undoing changes

```bash
git reset (file)   # unstages file
git reset (commit) # undoes all commits thereafter, but keep the changes
git reset --hard (commit) # go nuclear (i.e., lose changes after commit)
```

## Peeking at a file's history of changes (i.e., patches)

```bash
git log -p (file)
git show (commit):(file)  # commit or tag!
git show (commit):(file) > (file).copy  # retrieve the copy from hash
```

## Tagging

```bash
git tag (tagname) (commit)
```

---

<!-- _class: bigh1 -->

# Git's greatest strength
(in my opinion)

---

## Creating parallel versions of your files

* Think of your files as leaves on the branch of a tree (your repo)
* You can have different versions of the same file on different branches! :open_mouth:
* Expect your branches to merge back with the trunk
* Parallel versions: different branches
  1) Files start the same
  2) Differ after some commits
  3) Goal: merge back with trunk

![bg right](../img/tree.jpg)

---

### Create a branch

```bash
git branch <branch name>
```

### Check out―i.e., switch to―a branch

```bash
git checkout <branch name>
```

### Merging back with main (master) branch

```bash
git checkout master
git merge (branch name) # LPT: --no-ff
git branch -d (branch name)  # recommended cleanup
```

---

# Ignoring files

- Datasets
- References/Literature
- Files generated from other files
- Files that will never change

Create a file called `.gitignore` and chuck all that in it.

![bg right vertical fit](../img/gitignore.png)

---

## Example:

![bg fit](../img/gitignoreExample.png)

---

<!--
_backgroundImage: url(../img/pexels-frank-cone-2290057.jpg)
_backgroundSize: 100%
-->

<style scoped>
h1, h2, p {
	color: white;
	text-shadow: 2px 2px #444;
}
</style>

# Lightning round?

## Stashing and popping <b class="dimmer-light">(one "O", two "P"s)</b>


```bash
git stash  # 1. Sweep a temporary version under the rug
git pop    # 2. Retrieve it when you switch back
```

Useful if Git refuses to change branches!

<!-- because Git only handles conflicts when merging -->

## Working with remote repositories (e.g. GitHub, GitLab)

```bash
git clone  # 1. create a local copy of the remote repo
git pull   # 1. (if previously cloned, copy latest version of remote)
           # 2. do your sciency thing
git push   # 3. Copy your local branch to remote
```

---

# Supplementary material

- Your terminal
  - `git --help`
  - `man git`
- (Very well-curated) official documentation: https://git-scm.com/doc

![center h:300](../img/cheatSheet.jpg)
* [Yes](https://lmddgtfy.net/?q=git%20cheat%20sheet).

---

# Software used in this presentation

- Marp: Markdown Presentation Ecosystem
  https://marp.app/
- VSCodium: compiled, telemetry-free VSCode
  https://vscodium.com/
- GitKraken: Free Git GUI for Windows, Mac, Linux
  https://www.gitkraken.com/

![bg right:30% fit vertical](../img/marp-white.png)
![bg fit](https://raw.githubusercontent.com/VSCodium/vscodium/master/src/resources/linux/code.png)
![bg fit](../img/gitkraken-logo-mono-light-hz.png)

<!-- Getting used to the VSC environment could be useful for GitHub users due to the upcoming Codespaces -->

---

# Reference

:page_facing_up: Peikert, A., & Brandmaier, A. M. (2019). A Reproducible Data Analysis Workflow with R Markdown, Git, Make, and Docker (p. 45). p. 45. [DOI:10.31234/osf.io/8xzqy](https://doi.org/10.31234/osf.io/8xzqy)

# Credits

[OS icons](#installing-git) made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
Lightning photo by Frank Cone from Pexels
