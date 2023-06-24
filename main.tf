resource "bigip_ltm_node" "nginx-node1" {
  name    = "/Common/nginx-node1"
  address = "172.16.253.13"
  monitor = "bigip_ltm_monitor.hotel_test.name"
}

resource "bigip_ltm_monitor" "hotel_test" {
  name     = "/Common/hotel_test"
  parent   = "/Common/http"
  receive =  "HTTP/1.1 200 OK"
}
