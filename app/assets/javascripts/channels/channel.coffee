App.cable.subscriptions.create "WebSocketChannel",
  received: (data) ->    
    if data.type == 'stargazers_count'
      $("#count").html(data.result)
    else if data.type == 'starring'
      if data.result == true
        $("#stream").html("<div>GitHub starring succeed</div>")
      else
        $("#stream").html("<div>GitHub starring failed</div>")
