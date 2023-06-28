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


resource "bigip_ltm_virtual_server" "example_vip" {
  name        = "/Common/example_vip"
  description = "VIP_DESCRIPTION"
  destination = "172.16.230.4"
  ip_protocol = "tcp"
  port = 443
  pool        = "/Common/pool_test"
}


resource "bigip_ltm_snatpool" "snatpool_sanjosee" {
  name    = "/Common/snatpool_sanjosee"
  members = ["191.1.1.1", "194.2.2.2"]
}
