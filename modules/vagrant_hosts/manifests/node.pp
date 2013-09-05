#
define vagrant_hosts::node {
  host { "node${title}.example.com":
    ip =>  inline_template('<%= "192.168.19." + (@title.to_i + 100).to_s %>'),
  }
}
