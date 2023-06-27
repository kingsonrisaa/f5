resource "bigip_ltm_monitor" "hotel_test" {
  name     = "/Common/hotel_test"
  parent   = "/Common/http"
  receive  = "HTTP/1.1 200 OK"
}

resource "bigip_ltm_pool" "pool_test" {
  name                   = "/Common/pool_test"
  load_balancing_mode    = "least-connections-member"
  monitors               = [bigip_ltm_monitor.hotel_test.name]
}

resource "bigip_ltm_node" "nginx-node1" {
  name    = "/Common/nginx-node1"
  address = "172.16.253.13"
  monitor = "/Common/icmp"
}

resource "bigip_ltm_pool_attachment" "attach-nginx-pool" {
  pool = bigip_ltm_pool.pool_test.name
  node = "${bigip_ltm_node.nginx-node1.name}:80"
}

resource "bigip_snat_pool" "example_snat_pool" {
  name        = "nat_test" 
  description = "nat testing"
  members = [
    "172.17.20.30",
    "172.17.20.312"
  ]
}
