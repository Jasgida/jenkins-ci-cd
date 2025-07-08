pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Jasgida/jenkins-ci-cd.git', branch: 'main'
            }
        }

        stage('Test') {
            steps {
                echo "Jenkinsfile is working correctly!"
            }
        }
    }
}
