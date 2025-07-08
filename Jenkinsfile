pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'docker pull python:3.10'
                sh 'docker run --rm python:3.10 pip install flask'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'echo "Running tests..."'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-app .'
            }
        }
    }
}
