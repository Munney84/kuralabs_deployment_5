pipeline {
    agent any
        stages {
            stage ('Build'){
                steps {
                    sh '''#!/bin/bash
                    python3 -m venv test3
                    source  test3/bin/activate
                    pip install pip --upgrade
                    pip install -r requirements.txt
                    export FLASK_APP=application
                    flask run &
                    '''
                }
            }
            
            stage ('Test'){
                steps {
                    sh '''#!/bin/bash
                    source test3/bin/activate
                    py.test --verbose --junit-xml  test-reports/results.xml
                    '''
                }
                post {
                    always {
                        junit 'test-reports/results.xml'
                    }
                }
            }

            stage ('Create_Image'){
                agent{label 'docker_agent'}
                steps {
                withCredentials([string(credentialsId: 'DOCKERHUB_UNAME', variable: 'dockerhub_uname'),
                                    string(credentialsId: 'DOCKERHUB_PASSWD', variable: 'dockerhub_passwd')]) {
                    sh ''' #!/bin/bash
                    apt update
                    
                    '''
                    
                    }
                }
            }
            stage ('Push_to_Docker'){
                agent{label 'docker_agent'}
                steps {
                withCredentials([string(credentialsId: 'DOCKERHUB_UNAME', variable: 'dockerhub_uname'),
                                    string(credentialsId: 'DOCKERHUB_PASSWD', variable: 'dockerhub_passwd')]) {
                    sh '''#!/bin/bash
                    
                    '''
                    
                    }
                }
            }

            stage ('Deploy_to_ECS'){
                agent{label 'docker_agent'}
                steps {
                withCredentials([string(credentialsId: 'DOCKERHUB_UNAME', variable: 'dockerhub_uname'),
                                    string(credentialsId: 'DOCKERHUB_PASSWD', variable: 'dockerhub_passwd')]) {
                    
                    
                    }
                }
            }
        
        