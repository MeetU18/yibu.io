# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $("div.actions > a.preview.button").on 'click', ->
    content = $('textarea.editor').val()
    if content == ''
      return
    $('#topicPreview > input[name="content"]').val(content)
    $('#topicContentPreview').html('<p>处理中&#133;</p>').show()
    $('#topicPreview').submit()

  $('#topicPreview').on('ajax:success', (e, data, status, xhr)->
    $('#topicContentPreview').html(data.preview_content)
  ).on "ajax:error", (e, xhr, status, error) ->
    $('#topicContentPreview').html('<p>服务器错误，请保存内容，稍后再试</p>')