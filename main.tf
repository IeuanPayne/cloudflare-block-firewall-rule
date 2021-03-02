resource "cloudflare_filter" "common_block_firewall_filter" {
  zone_id = var.zone_id
  description = ""
  expression = "(http.host eq \"${var.domain}\" and not ip.src in {${var.allow_ip}})"
}

resource "cloudflare_firewall_rule" "common_block_firewall_rule" {
  zone_id = var.zone_id
  description = "${var.domain} - Allow Only"
  filter_id = "${cloudflare_filter.common_block_firewall_filter.id}"
  action = "block"
  priority = var.priority
  
}