

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Environment') {
            steps {
                sh 'java -version'
                sh 'git --version'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Next, we will configure Python testing for this Linux-based Jenkins container.'
            }
        }
    }
}
