pipeline {
    agent any
    stages {
        stage('Publish Branch') {
            when {
                branch 'publish'
            }
            steps {
		        sh 'docker run --rm -it -w /tmp -v $PWD:/tmp tapp-android:v1.0.6 /bin/bash /tmp/scripts/publishBranch.sh'
            }
        }
        stage('Other Branch') {
            when {
                not {
          	    anyOf {
  		        branch 'publish'
          	    }
                
                }
            }
            steps {
		        sh 'docker run --rm -it -w /tmp -v $PWD:/tmp tapp-android:v1.0.6 /bin/bash /tmp/scripts/otherBranch.sh'
            }
        }

    }
}
