
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run Python Tests') {
            steps {
                sh '''
                    docker run --rm \
                      -v "$PWD:/app" \
                      -w /app \
                      python:3.12-slim \
                      sh -c "pip install --quiet -r requirements.txt && python -m unittest -v test_app.py"
                '''
            }
        }
    }
}
