pipelineJob('Configuration as Code Plugin') {
    definition {
        cps {
            script('''
                node("master") {
                    stage("printenv") {
                        sh 'printenv'
                    } 
                }          
            ''')
            sandbox()
        }
    }
}