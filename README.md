# Jenkins CI/CD Pipeline with Docker

This project demonstrates a complete CI/CD pipeline using **Jenkins**, **Docker**, and **GitHub** for a Python Flask application. The pipeline is defined as code using a `Jenkinsfile` and includes steps to clone the repo, install dependencies, run tests, and build a Docker image.

---

## 🛠️ Tools Used

- Jenkins (Pipeline as Code)
- Docker (Containerization)
- GitHub (Version Control)
- Flask (Simple Web App)
- VS Code (Local Dev Environment)

---

## 🧱 Architecture Overview

1. Developer pushes code to GitHub  
2. Jenkins pulls the code and runs pipeline steps  
3. Pipeline installs dependencies and builds a Docker image  
4. *(Optional)* Docker image is pushed to Docker Hub  

---

## 🚀 How to Run Locally

### Prerequisites
- Docker Desktop installed and running
- VS Code with Git installed
- GitHub repo cloned locally

### Run Jenkins in Docker

```bash
docker run -d --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v //var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts

### Unlock Jenkins (Get Admin Password)

```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

Copy the output and paste it into the Jenkins web UI to continue the setup

---

## ⚙️ CI/CD Pipeline Steps (Jenkinsfile)

The `Jenkinsfile` in this repo defines the CI/CD pipeline using a declarative syntax. The pipeline performs the following steps:

1. **Clone the GitHub repo**
2. **Install Python/Flask dependencies** using `requirements.txt`
3. **Run mock/unit tests**
4. **Build a Docker image** from the Flask app

---

## 📁 Folder Structure

jenkins-ci-cd/
├── app/
│ ├── app.py
│ └── requirements.txt
├── Dockerfile
├── Jenkinsfile
├── README.md
"# test" 
"# test" 
