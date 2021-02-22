class Application

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
      if req.path.include?("/items")
        name = req.path.split("/").last
        k = @@items.find do |item|
            item.name == name
        end
        if k
        resp.write k.price
        else
            resp.status = 400
            resp.write "Item not found"
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end
  
      resp.finish
    end
  end 