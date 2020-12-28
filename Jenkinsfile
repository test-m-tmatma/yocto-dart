#!/usr/bin/env groovy


pipeline  {
	environment {
		clone_sh = 'clone.sh'
		build_image_sh = 'build-image.sh'
		build_sh = 'yocto-build.sh'
	}
	agent any
	triggers {
		pollSCM('*/5 * * * *')
	}
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
		stage('image build') {
			steps {
				script {
					sh ("${env.WORKSPACE}/${build_image_sh}")
				}
			}
		}
		stage('build') {
			steps {
				script {
					sh ("${env.WORKSPACE}/${build_sh}")
				}
			}
		}
	}
}
