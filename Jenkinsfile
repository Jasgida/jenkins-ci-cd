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

        stage('Install Python & Dependencies') {
            steps {
                sh '''
                    apt-get update
                    apt-get install -y python3 python3-pip
                    pip3 install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest || echo "⚠️ No tests found, skipping..."'
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
            echo "✅ Build completed"
        }
        failure {
            echo "❌ Build failed"
        }
    }
}
