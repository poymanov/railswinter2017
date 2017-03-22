# encoding: utf-8

require 'rexml/document'

current_path = File.dirname(__FILE__)

require_relative "lib/game"
require_relative "lib/question"

file_path = current_path + "/data/data.xml"

game = Game.new(file_path)
game.play