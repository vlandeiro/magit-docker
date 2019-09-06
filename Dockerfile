FROM ubuntu:latest

COPY startup.el /startup.el
COPY .emacs /root/.emacs
COPY .bashrc /root/.bashrc

RUN apt-get update
RUN apt-get install -y \
  git \
  emacs25-nox \
  elpa-magit


ENV EMACS_BRANCH="master"
ENV EMACS_VERSION="master"

RUN emacs --batch -l /startup.el
RUN rm /startup.el
RUN mkdir /.ssh
RUN mkdir /gitrepo; cd gitrepo

CMD cd /gitrepo; emacs --no-window-system --eval '(progn (magit-status) (delete-other-windows))'
