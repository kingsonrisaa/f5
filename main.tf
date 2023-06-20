resource "bigip_ltm_node" "nginx-node1" {
  name    = "/Common/nginx-node1"
  address = "172.16.253.13"
}

resource "bigip_ltm_snatpool" "snatpool_santiago" {
  name    = "/Common/snatpool_santiago"
  members = ["191.1.1.1", "194.2.2.2"]
}

resource "bigip_ltm_policy" "test-policy-test" {
  name           = "my_policy-test"
  strategy       = "first-match"
  requires       = ["http"]
  published_copy = "Drafts/my_policy"
  controls       = ["forwarding"]
  rule {
    name = "rule6"

    action {
      tm_name    = "20"
      forward    = true
      connection = false
      pool       = "/Common/mypool"
    }
  }
  depends_on = [bigip_ltm_pool.mypool]
}

resource "bigip_ltm_pool" "mypool" {
  name                = "/Common/mypool"
  monitors            = ["/Common/http"]
  allow_nat           = "yes"
  allow_snat          = "yes"
  load_balancing_mode = "round-robin"
}
