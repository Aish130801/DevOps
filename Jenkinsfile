pipeline {
    agent any
    stages {
        stage ('Makefile, Execute, Clean') {
            steps {

                sh '''#!/bin/bash

                make
                ./add
                make clean

                '''

            }
        }
    }
}
