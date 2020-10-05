pipeline { // 标头
    agent any
    stages {

        stage('Docker Container Creation') {
            steps {
		ehco HELLO
                sh '''
                // 开启docker image container
		// -d后台模式开启container 并返回container id 运行bash shell保持container alive
		// 当前目录挂载到docker container /android目录下
		docker run -d ubuntu:latest -v /:/android /bin/bash 
                '''
            }
        }

        stage('Clean') {
            steps {
                sh '''
                // 清理项目
		docker exec 9df70f9a0714 /android/gradlew clean
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                // Build Android工程
                // 清理项目
		docker exec 9df70f9a0714 /android/gradlew build
                '''
            }
        }

        stage('Unit Test') {
            steps {
                sh '''
                // 运行单元测试
                // 清理项目
		docker exec 9df70f9a0714 /android/gradlew unitest
                '''
            }
        }

        stage('APK Package && Sign') {
            when {
                branch 'publish'
            }
            steps {
                sh '''
                    // debug证书keystore打包加签名
                '''
            }
        }

        stage('Push To Google Play Alpha Channel') {
            when {
                branch 'publish'
            }
            steps {
                sh '''
                    // fastlane 推送到Google Play Alpha Channel
                    // docker run --rm -v $PWD:/tmp -w /tmp budtmo/docker-android-x86-9.0 ./gradlew assembleSandboxAlpha assembleProduction --no-daemon // 核心docker命令
                '''
            }
        }

        post { // 后处理
            always {
                // 关闭删除docker container
            }
        }
    }
}
