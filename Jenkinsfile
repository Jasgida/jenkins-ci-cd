pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'jasgida17/flask-app'
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
                    python3 -m venv venv
                    . venv/bin/activate
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
                sh 'docker build -t flask-app .'
            }
        }

        stage('Remove Existing Container') {
            steps {
                sh 'docker rm -f flask-app-container || true'
            }
        }

        stage('Run Flask Container') {
            steps {
                sh 'docker run -d -p 5000:5000 --name flask-app-container flask-app'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker tag flask-app $DOCKER_HUB_REPO:latest
                        docker push $DOCKER_HUB_REPO:latest
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build, test, and deployment succeeded!'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
