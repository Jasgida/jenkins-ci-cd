pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                script {
                    docker.image('python:3.10').inside {
                        sh 'pip install -r app/requirements.txt'
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running mock tests (none implemented yet)'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-jenkins-app .'
            }
        }
    }
}
