FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y \
  git \
  emacs-nox \
  elpa-magit \
  locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV EMACS_BRANCH="master"
ENV EMACS_VERSION="master"

COPY startup.el /startup.el
COPY .emacs /root/.emacs
COPY .bashrc /root/.bashrc

RUN emacs --batch -l /startup.el
RUN rm /startup.el
RUN mkdir /.ssh
RUN mkdir /gitrepo; cd gitrepo

CMD cd /gitrepo; emacs --no-window-system --eval '(progn (magit-status) (delete-other-windows))'
