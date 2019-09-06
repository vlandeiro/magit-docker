# Magit on docker

## Description

This docker image installs emacs, magit and helm. It then runs magit in
`/girepo` in the container. In order to use it on a repository on your machine,
you will need to mount a volume on the container using:

```sh
docker run -v /path/to/your/repo:/gitrepo -it vlandeiro/magit`
```

### Why not install Emacs?

Unfortunately, Emacs tends to be somewhat intimidating for new users. Despite
projects to make Emacs more accessible (e.g. spacemacs or doom-emacs), it
remains a commitment for users to move to Emacs. Because of that, users are
missing out on great features built on top of Emacs. One of them is -- you
guessed it -- [Magit](https://magit.vc/).

### Resources 

- [Magit official website](https://magit.vc/)
- [An introduction to Magit](https://www.masteringemacs.org/article/introduction-magit-emacs-mode-git)
- [Magit introduction and demonstration (Video)](https://www.youtube.com/watch?v=vQO7F2Q9DwA)

## Installation

### Requirements

First, install `docker` on your machine. Next, you can use the following aliases
to easily run `magit` in your terminal. Note, that running `magit` will start
magit in the current folder. Additionally, magit is just an (incredible)
interface to use git so you do need to understand how git works.

### Windows 10

```sh
function Run-Magit { docker run -it -v ${PWD}:/gitrepo vlandeiro/magit }
Set-Alias -Name magit -Value Run-Magit
```

### Linux

```sh
alias magit=docker run -it -v $(pwd):/gitrepo -v $(HOME)/.gitconfig:/root/.gitconfig $(HOME)/.ssh:/root/.ssh vlandeiro/magit
```

