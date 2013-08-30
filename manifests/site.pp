node 'hub.example.com' {
  class { 'activemq':
    hub => true,
  }
}

node /^broker\d+\.example.com/ {
  class { 'activemq':
    spoke => true,
  }
}

node /^node\d+.example.com/ {
}
