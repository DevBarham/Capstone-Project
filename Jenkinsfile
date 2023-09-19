pipeline {
    agent any
    stages {
        stage('Checkout from SCM') {
            steps {
                git branch: 'main', credentialsId: 'deploy',url: 'https://github.com/https://github.com/DevBarham/Capstone-Project.git'
            }
        }
        stage('Setup Terraform') {
            steps {
                sh 'wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip'
                sh 'unzip terraform_0.12.24_linux_amd64.zip'
                sh 'mv terraform /usr/local/bin/'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform init'
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'python -m pytest test.py'
            }
        }
    }
}