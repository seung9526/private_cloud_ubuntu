
locals {
  img_dir         = "/home/${var.user}/libvirt_images"
  base_image_path = "${local.img_dir}/ubuntu-22.04-server-cloudimg-amd64.img"
}

resource "libvirt_pool" "userpool" {
  name = "userpool_terraform"
  type = "dir"
  # 기존 경로 뒤에 /terraform_data 처럼 하위 디렉토리를 하나 더 붙이세요.
  path = "/home/test1/.local/share/libvirt/images/terraform_data"
}

# -----------------------------
# 이미지 디렉토리 생성
# -----------------------------
resource "null_resource" "create_image_dir" {
  provisioner "local-exec" {
    command = "mkdir -p ${local.img_dir}"
  }
}

# -----------------------------
# Cloud-init ISO
# -----------------------------
resource "libvirt_cloudinit_disk" "cloudinit" {
  depends_on = [null_resource.create_image_dir]

  name      = "${var.vm_name}-cloudinit.iso"
  user_data = file("${path.module}/cloud_init.cfg")
  pool      = libvirt_pool.userpool.name
}

# -----------------------------
# VM Disk (cloud image clone)
# -----------------------------
resource "libvirt_volume" "vm_disk" {
  name   = "${var.vm_name}.qcow2"
  pool   = libvirt_pool.userpool.name
  source = "/home/test1/.local/share/libvirt/images/ubuntu-22.04-server-cloudimg-amd64.img"
  format = "qcow2"
}

# -----------------------------
# VM Domain
# -----------------------------
resource "libvirt_domain" "vm" {
  name   = "terraform-test-vm-new"
  memory = var.memory
  vcpu   = var.vcpu
  type   = "qemu"  # Rootless 모드에서는 qemu 사용

  disk {
    volume_id = libvirt_volume.vm_disk.id
  }

  cloudinit = libvirt_cloudinit_disk.cloudinit.id

  network_interface {
    network_name = "default"
  }

  console {
    type        = "pty"
    target_port = "0"
  }

  graphics {
    type        = "spice"
    listen_type = "none"
  }
}
