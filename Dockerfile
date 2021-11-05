ARG JENKINS_VERSION=lts-slim
FROM jenkins/jenkins:$JENKINS_VERSION

LABEL maintainer="Mareks Pikalovs https://www.linkedin.com/in/mareks-pikalovs-b3649919/"

USER root

# Update packages and install python prerequisites
RUN apt update && apt upgrade -y && apt install -y python3-pip \
    && rm -rf /var/lib/apt/lists/*

COPY jenkins-plugins.txt /tmp/jenkins-plugins.txt
COPY python-packages.txt /tmp/python-packages.txt

WORKDIR /tmp

# Install jenkins plugins
RUN jenkins-plugin-cli --plugin-file jenkins-plugins.txt


# Install puthon packages
RUN pip3 install -r python-packages.txt


USER jenkins

#COPY ansible.yaml /tmp/ansible.yaml

#RUN ansible-galaxy collection install -r /tmp/ansible.yaml

ENV CASC_JENKINS_CONFIG /var/jenkins_home/jcasc_configs
RUN mkdir /var/jenkins_home/jcasc_configs
#COPY ./jcasc_configs /var/jenkins_home/jcasc_configs/

# Skip wizard
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"