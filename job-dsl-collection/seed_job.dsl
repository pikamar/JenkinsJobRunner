job('Seed Job') {
    scm {
        git {
            remote {
                name('Remote Pipeline')
                url("${REMOTE_DSL}")
            }
        }
    }
}

job.parameters {
    stringParam('REMOTE_DSL', "https://raw.githubusercontent.com/pikamar/JenkinsJobRunner/main/job-dsl-collection/pipeline.dsl" ,'Remote DSL script')
}