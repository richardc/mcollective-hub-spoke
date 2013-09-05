#
define vagrant_hosts::broker {
  host { "broker${title}.example.com":
    ip =>  inline_template('<%= "192.168.19." + (@title.to_i + 50).to_s %>'),
  }
}
