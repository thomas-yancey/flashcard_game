def logged_in?
  !!session[:user]
end

def canonical(word)
  word.strip.downcase
end
