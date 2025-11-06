
#!/bin/bash
# =========================================
# 🔥 Firewall Configuration Script
# =========================================

set -e

echo "[1/3] Enabling UFW firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw --force enable

echo "[2/3] Checking firewall status..."
sudo ufw status verbose

echo "✅ Firewall configuration completed!"
