# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Note: (omarps) This coffeescript was not loading when accessing the step link directly.
#       Due to delivery date

# Use turbolinks to ensure the script execution.
$(document).on 'ready turbolinks:load', ->
  select_color   = $("#select_color")
  other_color    = $("#other_color")
  favorite_color = $("#favorite_color")
  
  # Init select color and other color controls.
  colors = select_color.children("option").map(() -> this.value).toArray()
  other_color.hide()
  if (favorite_color.val() != "")
    if (colors.includes(favorite_color.val()))
      favorite_color.val(select_color.val())
    else
      select_color.val("Other")
      other_color.val(favorite_color.val())
      other_color.show()
  else
    favorite_color.val(select_color.val())

  # Select color on change.
  select_color.on('change', () ->
    if (this.value == "Other")
      favorite_color.val("")
      other_color.show()
      other_color.focus()
    else
      other_color.hide()
      favorite_color.val(this.value)
  )
  
  # Other color on change.
  other_color.on('keyup', (evt) ->
    favorite_color.val(other_color.val())
  )