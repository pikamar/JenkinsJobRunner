properties([
    buildDiscarder(
        logRotator(
            artifactDaysToKeepStr: '1',
            artifactNumToKeepStr: '1',
            daysToKeepStr: '1',
            numToKeepStr: '1'
        )
    ), parameters([
        string(name: 'PIPELINE_URL', defaultValue: 'https://raw.githubusercontent.com/pikamar/JenkinsJobRunner/main/job-dsl-collection/pipeline.dsl', description: 'Seed Job URL'),
        string(name: 'ENV', defaultValue: 'dev', description: 'Environment'),
    ]),pipelineTriggers([])
])

pipeline {
    agent any

    environment {
        ENV="${params.ENV}"
        PIPELINE_URL="${params.PIPELINE_URL}"
    }
    
    options {
        timeout(time: 30, unit: 'MINUTES')
    }

    stages {
        stage('Pipeline build') {
            steps {
                script {
                    //def app = load "env.groovy"

                    sh "curl ${PIPELINE_URL} -o seed_job.groovy"
                    
                    // Generate generic pipelines
                    step([
                       $class: 'ExecuteDslScripts',
                        targets: ['seed_job.groovy'].join('\n'),
                        removedJobAction: 'IGNORE',
                        removedViewAction: 'IGNORE',
                        lookupStrategy: 'JENKINS_ROOT',
                        additionalParameters: [env: "${ENV}"]
                    ])
                }
            }
        }
    }
}