# 📦 Local YUM Server Setup for RHEL/CentOS

![GitHub](https://img.shields.io/github/license/SouravDasHriday/my-yum-server)
![Shell Script](https://img.shields.io/badge/Shell_Script-%23121011.svg?logo=gnu-bash&logoColor=white)
![RHEL](https://img.shields.io/badge/RHEL-8+-EE0000)

Automated setup for local YUM repositories using RHEL/CentOS installation media. Perfect for air-gapped environments or faster package management.

## 🚀 Features

- One-command setup
- No internet required
- Supports both BaseOS and AppStream
- Optional HTTP sharing
- Clean, idempotent implementation

## 📦 Prerequisites

- RHEL/CentOS 8+ installation media (DVD/ISO)
- Root access
- Git (for deployment)

## 🛠️ Installation

### Method 1: Direct Download
```bash
curl -LO https://raw.githubusercontent.com/SouravDasHriday/my-yum-server/main/scripts/setup.sh
chmod +x setup.sh
sudo ./setup.sh

### Method 2: Clone Repository
git clone https://github.com/SouravDasHriday/my-yum-server.git
cd my-yum-server
sudo ./scripts/setup.sh
🌟 Usage
## Basic Setup
sudo ./setup.sh
## With HTTP Sharing
sudo ENABLE_HTTP=true ./setup.sh

## Verify Repository
sudo dnf --disablerepo='*' --enablerepo='local-*' list available

🖥️ Deployment on New Machines
1. Transfer Installation Media

Mount your RHEL/CentOS ISO at default location:
bash
Copy

sudo mount /path/to/iso /run/media/root/RHEL-8-10-0-BaseOS-x86_64

2. Remote Execution (via SSH)
bash
Copy

ssh root@new-machine "git clone https://github.com/SouravDasHriday/my-yum-server.git && cd my-yum-server && sudo ./scripts/setup.sh"

🛠️ Customization

Edit configs/local-rhel8.repo to:

    Change repository paths

    Enable GPG checking

    Add custom repositories

🚨 Troubleshooting
Common Issues

    DVD Not Detected: Verify mount point exists at /run/media/root/RHEL-8-10-0-BaseOS-x86_64

    Permission Errors: Run sudo chown -R root:root /yum-repo

    YUM Cache Issues: sudo dnf clean all && rm -rf /var/cache/dnf


🤝 Contributing

Pull requests welcome! Please follow:

    Use consistent shell style

    Document new features

    Update tests


📜 License
MIT © Sourav Das

---

### Key Professional Touches Added:
1. **Badges** - For visual metadata
2. **Multiple Installation Methods** - Catering to different use cases
3. **Remote Execution Guide** - For deploying across machines
4. **Structured Documentation** - With clear sections
5. **Troubleshooting Section** - Quick solutions to common issues
6. **Clean Formatting** - Using consistent markdown styling
7. **License Info** - Important for open-source projects

### How to Implement:
1. Save this as `README.md` in your repository root
2. Commit and push:
   ```bash
   git add README.md
   git commit -m "Add professional README"
   git push origin main