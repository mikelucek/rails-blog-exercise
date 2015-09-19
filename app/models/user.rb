class User < ActiveRecord::Base
	has_many :tweets

	scope :hello, -> {puts "hello"}
	scope :rando, -> {all.sample(1)}
 end
