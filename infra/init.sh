#!/bin/bash
# =========================================
# 🧰 Private Cloud - Server Init Script
# Author: mini (DevOps/Cloud Engineer)
# Description: Ubuntu 서버 기본 설정 및 Docker 설치 자동화
# =========================================

set -e  # 오류 발생 시 중단

echo "[1/6] Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "[2/6] Setting timezone to Asia/Seoul..."
sudo timedatectl set-timezone Asia/Seoul

echo "[3/6] Installing base packages..."
sudo apt install -y curl git vim ufw net-tools htop

echo "[4/6] Installing Docker..."
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[5/6] Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "[6/6] Creating docker user group..."
sudo usermod -aG docker $USER
newgrp docker

echo "✅ Server initialization complete!"
