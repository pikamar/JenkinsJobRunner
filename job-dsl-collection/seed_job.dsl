job('Seed Job') {
    scm {
        git {
            remote {
                name('Remote Pipeline')
<<<<<<< HEAD
                url("${param.REMOTE_DSL}")
=======
                url("http://example.com")
>>>>>>> 37980c78ca70f378a301a150436499112f58753c
            }
        }
    }
}

job.parameters {
    stringParam('REMOTE_DSL', "https://raw.githubusercontent.com/pikamar/JenkinsJobRunner/main/job-dsl-collection/pipeline.dsl" ,'Remote DSL script')
}
