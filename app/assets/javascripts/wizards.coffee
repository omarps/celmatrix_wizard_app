# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$( document ).ready(() ->
  $("#select_color").on('change', () ->
    # TODO: Other
    console.log('@@@', $("#favorite_color").val(), this.value)
    $("#favorite_color").val(this.value)
  )
)