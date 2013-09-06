#
define spoke_demo::node($network, $domain) {
  host { "node${title}.${domain}":
    ip =>  inline_template('<%= @network + "." + (@title.to_i + 100).to_s %>'),
  }
}
