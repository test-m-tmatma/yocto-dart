#!/usr/bin/env groovy

pipeline  {
	environment {
		clone_sh = 'clone.sh'
	}
	agent any
	stages {
		stage('Checkout') {
			steps {
				checkout scm
				script {
					def commitHash = "${GIT_COMMIT}"
					def branchName = "${GIT_BRANCH}"
					def shortHash = commitHash.take(8)
					currentBuild.displayName = "#${BUILD_NUMBER}-${branchName}-${shortHash}"
				}
			}
		}
		stage('repo clone') {
			steps {
				script {
					sh ("${env.WORKSPACE}/${clone_sh}")
				}
			}
		}
	}
}
