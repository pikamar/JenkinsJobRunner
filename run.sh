docker run  --rm -p 8080:8080 \
    -e GIT_PASSWORD=tiripiri \
    -e PIPELINE_URL=https://raw.githubusercontent.com/Praqma/job-dsl-collection/master/configuration-as-code-dsl/pipeline.dsl \
    -v $(pwd)/jcasc_configs/jenkins-general.yaml:/var/jenkins_home/jcasc_configs/jenkins-general.yaml \
    -v $(pwd)/jcasc_configs/jenkins-unclassified.yaml:/var/jenkins_home/jcasc_configs/jenkins-unclassified.yaml \
    -v $(pwd)/jcasc_configs/jenkins-security.yaml:/var/jenkins_home/jcasc_configs/jenkins-security.yaml \
    -v $(pwd)/jcasc_configs/jenkins-credentials.yaml:/var/jenkins_home/jcasc_configs/jenkins-credentials.yaml \
    -v $(pwd)/jcasc_configs/jenkins-jobs.yaml:/var/jenkins_home/jcasc_configs/jenkins-jobs.yaml \
    -v $(pwd)/job-dsl-collection/pipeline.groovy:/var/jenkins_home/jcasc_configs/pipeline.groovy \
    --name jenkins pikamar/jenkins:latest
