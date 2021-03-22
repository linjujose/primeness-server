class ApplicationController < ActionController::Base
    def hello
        render plain: "Hello Trufans"
    end
end
