resource "bigip_ltm_node" "server_nginx" {
  name    = "/Common/nginx"
  address = "172.16.253.13"
}
