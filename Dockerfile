FROM jenkins/jenkins:latest

EXPOSE 8080:8080

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

COPY --chown=jenkins:jenkins my_marvin.yml /var/jenkins_home/casc_configs/my_marvin.yml
ENV CASC_JENKINS_CONFIG="/var/jenkins_home/casc_configs"

COPY --chown=jenkins:jenkins job_dsl.groovy /var/jenkins_home/job_dsl.groovy
