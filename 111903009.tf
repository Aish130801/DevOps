# Defining VM Volume
resource "libvirt_volume" "ubuntu-jammy" {
  name = "ubuntu-server 22.04"
  pool = "default" 
  source = "https://cloud-images.ubuntu.com/jammy/"
  #source = "https://cloud-images.ubuntu.com"
  format = "jammy"
}

resource "libvirt_volume" "fedora-qcow2" {
  name = "fedora"
  pool = "default"
  source = "http://fedora-Cloud-Base-36-1.5.x86_64.qcow2/"
  #source = "https://alt.fedoraproject.org/cloud/"
  format = "qcow2"
}

#VM1
resource "libvirt_domain" "ubuntu-server 22.04" {
  name   = "ubuntu-server 22.04"
  memory = "512"
  vcpu   = 2

  network_interface {
    network_name = "default"
  }

  disk {
    volume_id = "${libvirt_volume.ubuntu-jammy.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

output "ip" {
  value = "${libvirt_domain.ubuntu.network_interface.0.addresses.0}"
}

#VM2
resource "libvirt_domain" "fedora" {
  name   = "fedora"
  memory = "512"
  vcpu   = 2

  network_interface {
    network_name = "default"
  }

  disk {
    volume_id = "${libvirt_volume.fedora-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

output "ip" {
  value = "${libvirt_domain.fedora.network_interface.0.addresses.0}"
}