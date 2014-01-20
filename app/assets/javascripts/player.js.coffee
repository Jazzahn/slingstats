# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
    $("td.timestamp").each (i, data) ->
        # * 1000 because JS deals in milliseconds
        ts = parseInt(data.innerHTML) * 1000
        d = new Date ts 
        data.innerHTML = d.toLocaleString()
        return
    return
