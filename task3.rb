  module Validations 
    def validate_presence *attr
      @@valid_params = []
      @@valid_params << attr
    end
    

    def self.included base
      base.extend Validations
    end

    def valid? 
      if @params.empty? == false
        @params.each do |el, key|
          @@valid_params.each do |val|
            if val.include? el
              return false 
            else
              return true
            end 
          end
        end
      else
        return false
      end
    end
  end

  class User
    include Validations

    attr_accessor :name
  
    validate_presence :name

    def initialize *params 
      @params = params
    end

   
  end

user = User.new 
p user.valid?



