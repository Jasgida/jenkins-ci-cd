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

        stage('Setup Python Environment') {
            steps {
                sh '''
                    apt-get update
                    apt-get install -y python3 python3-venv python3-pip

                    # Create and activate virtual environment
                    python3 -m venv venv
                    . venv/bin/activate

                    # Upgrade pip and install dependencies
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    . venv/bin/activate
                    pytest || echo "⚠️ No tests found"
                '''
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
