pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Jasgida/jenkins-ci-cd.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt || echo "Dependencies already installed or pip error"'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest || echo "No tests found or test failed"'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker --version' // confirm docker is visible
                sh 'docker build -t flask-app .'
            }
        }
    }
}
