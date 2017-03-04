# encoding: utf-8

require_relative "bodybuilder"

bodybuilder_one = Bodybuilder.new
bodybuilder_one.grow_up("delta")
bodybuilder_one.grow_up("biceps")

bodybuilder_two = Bodybuilder.new
bodybuilder_two.grow_up("biceps")
bodybuilder_two.grow_up("triceps")

bodybuilder_three = Bodybuilder.new
bodybuilder_three.grow_up("delta")
bodybuilder_three.grow_up("delta")
bodybuilder_three.grow_up("delta")
bodybuilder_three.grow_up("delta")

puts "Первый бодибилдер:"
bodybuilder_one.status

puts

puts "Второй бодибилдер:"
bodybuilder_two.status

puts

puts "Третий бодибилдер:"
bodybuilder_three.status