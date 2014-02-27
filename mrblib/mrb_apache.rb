class Apache
  class Request
    def reverse_proxy path
      self.handler  = "proxy-server"
      self.proxyreq = Apache::PROXYREQ_REVERSE
      self.filename = "proxy:" + path
    end
  end
  class Headers_in
    def user_agent
      self["User-Agent"]
    end
  end
end
