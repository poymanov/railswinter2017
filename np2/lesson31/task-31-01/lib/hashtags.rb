def hashtags(string)
  regexp = /#[a-z_а-я0-9\-]+/i
  result = string.scan(regexp)
  result.join(", ")
end