class HomeController < ApplicationController

def index
end

def search
puts "SEARCH*********************************************"
puts params.inspect
@user = User.all
@result = @user.where(name:params[:query])
puts @result
end

end
