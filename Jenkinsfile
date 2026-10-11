pipeline {
    agent any

    environment {
        STUDENT_NAME = 'Abai'
        STUDENT_SURNAME = 'Asan'
        STUDENT_GROUP = 'SE-2310'
        STUDENT_ID = '123456'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "1. Checking out source code..."
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "2. Building the project..."
                sh 'chmod +x app.sh'
            }
        }

        stage('Test') {
            steps {
                echo "3. Executing test/check stage..."
                sh '''
                    if [ -f "Asan_Abai_info.txt" ]; then
                        echo "Student information file exists."
                    else
                        echo "Error: Student information file missing!"
                        exit 1
                    fi
                '''
            }
        }

        stage('Docker Build') {
            steps {
                echo "4. Building Docker image..."
                sh 'docker build -t asan_abaika .'
            }
        }

        stage('Docker Run') {
            steps {
                echo "5. Running Docker container..."
                echo "Student: ${env.STUDENT_NAME} ${env.STUDENT_SURNAME}"
                echo "Group: ${env.STUDENT_GROUP}"
                echo "Student ID: ${env.STUDENT_ID}"
                
                sh '''
                    docker rm -f asan_abaika-container || true
                    docker run --name asan_abaika-container \
                      -e STUDENT_NAME=${STUDENT_NAME} \
                      -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                      -e STUDENT_GROUP=${STUDENT_GROUP} \
                      -e STUDENT_ID=${STUDENT_ID} \
                      asan_abaika
                '''
            }
        }
    }

    post {
        success {
            echo "Finished: SUCCESS"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
