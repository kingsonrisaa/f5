resource "bigip_ltm_node" "server_nginx" {
  name    = "/Common/nginx-node1"
  address = "172.16.253.13"
}
