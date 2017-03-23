# encoding: utf-8

require 'rexml/document'

current_path = File.dirname(__FILE__)

require_relative "lib/game"
require_relative "lib/question"

file_path = current_path + "/data/data.xml"

# Получение вопросов для викторины
questions = Question.parse_xml(file_path)

# Запуск игры
game = Game.new(questions)
game.play