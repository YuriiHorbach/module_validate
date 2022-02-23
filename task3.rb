# frozen_string_literal: true

# require 'rubocop'

module Validations
  def validate_presence(*attr)
    @@valid_params = []
    @@valid_params << attr
  end

  def self.included(base)
    base.extend Validations
  end

  def valid?
    if @params.empty? == false
      @params.each do |el, _key|
        return false if el.value? ''

        @@valid_params.each do |val|
          if val.include? el
            return false
          else
            return true
          end
        end
      end
    else
      false
    end
  end
end

class User
  include Validations

  attr_accessor :name

  validate_presence :name

  def initialize(*params)
    @params = params
  end
end

user = User.new name: 'aaa' # will be true
user1 = User.new name: ''   # will be false
user2 = User.new            # will be false
p user.valid?
p user1.valid?
p user2.valid?
