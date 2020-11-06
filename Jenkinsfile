pipeline {
    agent {
        docker {
            image 'ruby'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'gem uninstall -aIx'
                sh 'gem install bundler'
                sh 'bundle install'
            }
        }
        stage('Test') {
            steps {
                sh 'cucumber -t @desafio'
            }
        }
    }
}