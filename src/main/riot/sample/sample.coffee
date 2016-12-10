# sample.coffee

@str = 'test'

#@on 'update', (e) ->
#  console.log 'sample',@opts,e

@onInput = (e) ->
  @str = @refs.inputText.value
