pipeline {
    agent any
    environment {
        DOCKER_TOKEN = credentials("DOCKER_TOKEN")
    }
    stages {
        stage("Build") {
            steps {
                sh "chmod +x -R ./scripts"
                sh "./scripts/build.sh"
            }
            post {
                success {
                    echo "Build completed SUCCESSFULLY"
                }
                failure {
                    echo "Build FAILED."
                }
            }
        }
        stage("Push") {
            steps {
                sh "chmod +x -R ./scripts"
                sh "./scripts/push.sh"
            }
        }
    }
    post {
        success {
            echo "Pipeline SUCCESSFULLY completed"
        }
        failure {
            echo "Pipeline FAILED"
        }
        unstable {
            echo "Pipeline unstable"
        }
    }
}
