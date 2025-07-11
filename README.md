# Jenkins CI/CD Pipeline with Docker
# 🚀 Flask CI/CD Pipeline with Jenkins & Docker

This project demonstrates a **complete CI/CD pipeline** using **Jenkins**, **Docker**, and **GitHub** to deploy a Python Flask application. The pipeline is defined as code in a `Jenkinsfile` and automates the process of fetching code, installing dependencies, running tests, building a Docker image, and optionally pushing it to Docker Hub.

---

## 🛠️ Tools & Technologies

* **Jenkins** (Declarative Pipeline as Code)
* **Docker** (Containerization)
* **GitHub** (Source Control & Webhook Trigger)
* **Flask** (Lightweight Python Web Framework)
* **VS Code** (Local Development Environment)

---

## 🧱 Architecture Flow

```
  Developer pushes code to GitHub
            ⬇️
    GitHub triggers Jenkins via webhook *(or Jenkins polls GitHub)*
            ⬇️
     Jenkins runs pipeline stages defined in Jenkinsfile
            ⬇️
     - Install dependencies
     - Run unit tests
     - Build Docker image
     - Optionally push to Docker Hub
            ⬇️
     Docker container is built and deployed locally
```

---

## ⚙️ CI/CD Pipeline Overview (Jenkinsfile)

The `Jenkinsfile` automates the following steps:

1. ✅ **Checkout Code** from GitHub
2. 🔧 **Set Up Python Environment** with `requirements.txt`
3. 🧪 **Run Tests** using `pytest`
4. 🐳 **Build Docker Image**
5. 🚀 **Run Container Locally**
6. 📦 **Push Docker Image to Docker Hub** *(optional, with credentials)*

---

## 🐳 Run Jenkins with Docker

### Prerequisites:

* Docker Desktop running
* Git & VS Code installed

### Launch Jenkins in Docker:

```bash
docker run -d --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v //var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts
```

### Unlock Jenkins:

```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

Paste the output into Jenkins to complete setup.

---

## 🧪 Local Setup for Flask App

```bash
git clone https://github.com/Jasgida/jenkins-ci-cd.git
cd jenkins-ci-cd
python -m venv venv
source venv/bin/activate
pip install -r app/requirements.txt
python app/app.py
```

Visit: [http://localhost:5000](http://localhost:5000)

---

## 📁 Project Structure

```
jenkins-ci-cd/
├── app/
│   ├── app.py
│   └── requirements.txt
├── Dockerfile
├── Jenkinsfile
├── README.md
```

---

## ✅ Status

* [x] Fully functional Jenkins pipeline
* [x] Docker container builds and runs locally
* [x] Push to Docker Hub working
* [x] GitHub Webhook optional (can use polling)

---

## 🙌 Author

**David Onwukamuche** — DevOps Engineer

Connect on [GitHub](https://github.com/Jasgida)
