pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            dir '.'
            additionalBuildArgs '--network=host'
        }
    }

    environment {
        DOCKER_IMAGE = 'flask-app:latest'
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'python -m unittest discover'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('List Docker Images') {
            steps {
                sh 'docker images'
            }
        }
    }
}
