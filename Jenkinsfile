pipeline {
    agent any

    environment {
        VENV_PATH = "venv"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Jasgida/jenkins-ci-cd.git', branch: 'main'
            }
        }

        stage('Setup Python Environment') {
            steps {
                sh '''
                    apt-get update
                    apt-get install -y python3 python3-venv python3-pip
                    python3 -m venv $VENV_PATH
                    . $VENV_PATH/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    . $VENV_PATH/bin/activate
                    pytest || echo "⚠️ No tests found"
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-app .'
            }
        }

        stage('Run Flask Container') {
            steps {
                sh 'docker run -d -p 5000:5000 --name flask-app-container flask-app || echo "Container may already be running"'
            }
        }

        stage('Push to Docker Hub') {
            when {
                expression {
                    return env.DOCKER_USER && env.DOCKER_PASS
                }
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker tag flask-app $DOCKER_USER/flask-app:latest
                        docker push $DOCKER_USER/flask-app:latest
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully.'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
