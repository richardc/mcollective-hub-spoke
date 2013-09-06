#
define spoke_demo::broker($network, $domain) {
  host { "broker${title}.${domain}":
    ip =>  inline_template('<%= @network + "." + (@title.to_i + 50).to_s %>'),
  }
}
