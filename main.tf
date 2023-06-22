resource "bigip_ltm_node" "nginx-node1" {
  name    = "/Common/nginx-node1"
  address = "172.16.253.13"
  monitor = "/Common/http-nginx"
}

resource "bigip_ltm_monitor" "TC1" {
  name     = "/Common/test_monitor_tc1"
  parent   = "/Common/http"
  send     = "GET /some/path\r\n"
  timeout  = "999"
  interval = "990"
}

resource "bigip_ltm_monitor" "hotel_test" {
  name     = "/Common/hotel_test"
  parent   = "/Common/https"
  receive =  "HTTP/1.1 200 OK"
}
resource "bigip_ltm_snatpool" "snatpool_santiago" {
  name    = "/Common/snatpool_santiago"
  members = ["191.1.1.1", "194.2.2.2"]
}

