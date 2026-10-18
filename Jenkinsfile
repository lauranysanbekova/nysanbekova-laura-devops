pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Laura'
        STUDENT_SURNAME = 'Nysanbekova'
        STUDENT_GROUP   = 'IT2-2309'
        STUDENT_ID      = '37962'
        IMAGE_NAME      = 'nysanbekova-laura-devops'
        CONTAINER_NAME  = 'nysanbekova-laura-container'
        REPO_URL        = 'https://github.com/lauranysanbekova/nysanbekova-laura-devops.git'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code from GitHub...'
                git branch: 'main', url: "${REPO_URL}"
                sh 'ls -la'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'python3 --version'
                sh 'python3 -m py_compile app/app.py'
                echo 'Build OK: app.py compiled'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'test -f app/app.py'
                sh 'test -f Dockerfile'
                sh 'test -f Nysanbekova_Laura_info.txt'
                sh 'python3 app/app.py'
                echo 'All tests passed'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t ${IMAGE_NAME} ."
                sh "docker images ${IMAGE_NAME}"
            }
        }

        stage('Docker Run') {
            steps {
                echo 'Running Docker container...'
                sh "docker rm -f ${CONTAINER_NAME} 2>/dev/null || true"
                sh """
                    docker run --name ${CONTAINER_NAME} \
                        -e STUDENT_NAME=${STUDENT_NAME} \
                        -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                        -e STUDENT_GROUP=${STUDENT_GROUP} \
                        -e STUDENT_ID=${STUDENT_ID} \
                        ${IMAGE_NAME}
                """
                sh "docker ps -a --filter name=${CONTAINER_NAME}"
            }
        }
    }

    post {
        success {
            echo 'Pipeline Finished: SUCCESS'
        }
        failure {
            echo 'Pipeline Finished: FAILURE'
        }
    }
}
