#!/usr/bin/env groovy

folder("GROOVY")

def job = pipelineJob("Sample Groovy Job")

job.with {
    description 'Description'
    definition {
    	cps {
        	sandbox()
        	script(
'''
pipeline {
    agent any

    stages {
		stage('printenv'){
            steps {
                sh 'printenv'
            }
        }
    }
}
'''
        	)
    	}
	}
}

job.parameters {
    stringParam('STRING', "Value" ,'Default Value')
    booleanParam('BOOL', false, 'Description')
}
job.logRotator(1,1,1,1)