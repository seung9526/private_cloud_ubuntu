# 🏢 Private Cloud on Ubuntu

### 🎯 프로젝트 개요
Ubuntu Server 기반의 VM 위에서 프라이빗 클라우드 환경을 구성하는 프로젝트입니다.  
Terraform, Ansible, Docker 등을 활용하여 인프라 자동화 및 모니터링 환경을 구축합니다.

---

### 📁 디렉토리 구조
infra/ # IaC (Terraform, Ansible)
docker/ # Docker Compose 및 서비스 설정
scripts/ # 설치 및 관리 스크립트
docs/ # 설치 가이드 및 아키텍처 문서

yaml
코드 복사

---

### ⚙️ 현재 진행 상태
- [x] Ubuntu Server 설치 및 초기 세팅
- [x] GitHub 레포 생성 및 연결
- [x] Docker 설치 및 컨테이너 실행 확인
- [x] Nginx 컨테이너 테스트 완료
- [x] Jenkins 배포 파이프라인 구성 완료
- [x] Grafana 모니터링 컨테이너 실행
- [x] KVM/Libvirt 기반 VM 프로비저닝 자동화 (Terraform)
- [x] Cloud-init을 이용한 초기 사용자 및 SSH Key 주입 자동화
- [x] Ansible 인벤토리 구성 및 대상 VM 핑 테스트(Ping-Pong) 성공
- [ ] Ansible 자동화 구성 (추가 플레이북 작성 필요)
- [ ] 외부 접속 및 네트워크 최적화 (NAT/포트포워딩 확인)

