FROM registry.fedoraproject.org/fedora:28

# install dependencies
RUN dnf update -y && \
    dnf -y install @buildsys-build dnf-plugins-core && \
    dnf -y builddep ostree && \
    dnf clean all

# clone ostree and update master branch
COPY ostree-git.sh /
RUN ../ostree-git.sh 
 
# builds ostree + any additional commands
COPY ostree-test.sh /

# entry into the container will start at this directory
WORKDIR /ostree

# run the following as `/bin/sh -c` 
# or enter the container to execute ./ostree-test.sh
RUN ../ostree-test.sh


# BUILDING
# docker build -t ostree-fedora-test .

# RUNNING
# docker run -it --rm --entrypoint /bin/sh --name ostree-testing ostree-fedora-test
# --rm will remove container name when exit shell
# Run `docker pause ostree-fedora-testing` to suspend
# Run `docker unpase ostree-fedora-testing` to resume

###

# Ostree Testing Bash Scripts:
#
# (1)
# Changes are made on HOST machine
# This script below is to add and commit changes
# Run /home/cherylfong/Desktop/Github/add-commit-push-ostree.sh
#
# (2) (a) CONTAINER
# Build ostree on Docker F28
# run ostree-test.sh
#
# (3) (b) VM i.e. Vagrant
# run ostree-git.sh in ~
# run ostree-test.sh in ostree repo directory
