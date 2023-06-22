resource "bigip_ltm_node" "nginx-node1" {
  name    = "/Common/nginx-node1"
  address = "172.16.253.13"
  monitor = "/Common/http-nginx"
}

resource "bigip_ltm_snatpool" "snatpool_santiago" {
  name    = "/Common/snatpool_santiago"
  members = ["191.1.1.1", "194.2.2.2"]
}

