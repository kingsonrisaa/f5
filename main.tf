
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


resource "bigip_ltm_pool_attachment" "attach-nginx-pool" {
  pool = bigip_ltm_pool.pool_test.name
  node = "${bigip_ltm_node.nginx-node1.name}:80"
}

resource "bigip_ltm_node" "nginx-node1" {
  name    = "/Common/nginx-node1"
  address = "172.16.253.13"
  monitor = "/Common/icmp"
}

resource "bigip_ltm_virtual_server" "vs_tc4" {
  name                       = "/Common/test_vs_tc4"
  destination                = "10.255.255.254"
  description                = "VirtualServer-test"
  port                       = 443
  client_profiles            = ["/Common/clientssl"]
  server_profiles            = ["/Common/serverssl"]
  security_log_profiles      = ["/Common/global-network"]
  source_address_translation = "automap"
  profiles = [
    "/Common/fastL4",
  ]
}
