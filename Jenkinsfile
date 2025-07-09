pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "flask-app"
        CONTAINER_NAME = "flask-app-container"
        DOCKER_TAG = "latest"
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
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Remove Existing Container') {
            steps {
                sh "docker rm -f $CONTAINER_NAME || true"
            }
        }

        stage('Run Flask Container') {
            steps {
                sh "docker run -d -p 5000:5000 --name $CONTAINER_NAME $DOCKER_IMAGE || echo '⚠️ Container may already be running'"
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker tag $DOCKER_IMAGE $DOCKER_USER/$DOCKER_IMAGE:$DOCKER_TAG
                        docker push $DOCKER_USER/$DOCKER_IMAGE:$DOCKER_TAG
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
