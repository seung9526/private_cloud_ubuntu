# Jenkins LTS 이미지 기반
FROM jenkins/jenkins:lts

# root 권한으로 Docker 설치 (이미 jenkins 계정 있음)
USER root

# 필수 패키지 설치
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release git && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    usermod -aG docker jenkins && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Jenkins 기본 포트
EXPOSE 8080 50000

# Jenkins 초기화 스크립트 비활성화
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Jenkins 홈
USER jenkins
