resource "bigip_ltm_monitor" "node_monitor" {
  name   = "/Common/node_monitor"
  parent = "/Common/tcp"
  interval = 5
  timeout = 16
  send    = "GET /health-check HTTP/1.0\r\n\r\n"
  recv    = "HTTP/1.1 200 OK"
}

resource "bigip_ltm_node" "nginx-node1" {
  name    = "/Common/nginx-node1"
  address = "172.16.253.13"
  monitor = bigip_ltm_monitor.node_monitor.name
}
