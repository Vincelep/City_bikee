$(".list").replaceWith("<%= j render 'list', locals: {bikeestations: @bikeestations, latitude: @latitude, longitude: @longitude} %>")
