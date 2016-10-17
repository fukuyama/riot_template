# sample.coffee
@str = 'test'

@on 'update', (e) ->
  console.log 'sample',@opts,e
