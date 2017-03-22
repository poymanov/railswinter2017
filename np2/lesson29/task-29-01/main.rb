# encoding: utf-8

require "rexml/document"

current_path = File.dirname(__FILE__)

file = File.new(current_path + "/data.xml")
doc = REXML::Document.new(file)

name = doc.root.elements["name"].text
tel = doc.root.elements["tel"].text
email = doc.root.elements["email"].text
description = doc.root.elements["description"].text

puts name
puts tel + ", " + email
puts description