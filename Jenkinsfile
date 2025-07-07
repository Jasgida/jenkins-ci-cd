pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/Jasgida/jenkins-ci-cd.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'pip install -r app\\requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running mock tests (none implemented yet)'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t flask-jenkins-app .'
            }
        }
    }
}
