class Apache
  class Request
    def reverse_proxy path
      self.handler  = "proxy-server"
      self.proxyreq = Apache::PROXYREQ_REVERSE
      self.filename = "proxy:" + path
    end
  end
end
