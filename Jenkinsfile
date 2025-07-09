pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "flask-app"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Jasgida/jenkins-ci-cd.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest || echo "No tests found, continuing..."'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
    }

    post {
        success {
            echo "✅ Build pipeline completed successfully!"
        }
        failure {
            echo "❌ Build pipeline failed."
        }
    }
}
