class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_to_find = req.path.split("/items/").last
            if @@items.find{|i| i.name == item_to_find }
                item = @@items.find{|i| i.name == item_to_find }
                resp.write item.price
                resp.status = 200
            else
                resp.write "Item not found"
                resp.status = 400 
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end

end
