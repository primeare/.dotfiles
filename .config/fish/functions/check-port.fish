# ex. (check-port 8080)
function check-port \
  --wraps=lsof \
  --description='checks if any process occupied the specified port number' \
  --argument-names port;

  sudo lsof -i :$port
end
