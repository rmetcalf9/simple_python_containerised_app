ARG PYTHON_IMAGE

FROM ${PYTHON_IMAGE}

MAINTAINER Robert Metcalf

COPY ./not_in_git_combined_requirements.txt not_in_git_combined_requirements.txt

RUN pip3 install -r not_in_git_combined_requirements.txt
