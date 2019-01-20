module RequestSpecHelper
    # parse json to ruby hash
    def json
        JSON.parse(response.body)
    end
end