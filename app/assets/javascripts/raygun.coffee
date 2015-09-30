overflow = (str) ->
  if str.length > 100
    str.substring(0, 100) + '...'
  else
    str

RaygunErrors =
  controller: ->
    { list: m.request({ method: 'GET', url: '/raygun/list' }) }

  view: (ctrl) ->
    records = ctrl.list().activeErrors.records

    m '.results',
      records.map (record) -> [
        m '.title', overflow(record.message)
        m 'pre', m('code', JSON.stringify(record, null, 2))
      ]

DOM.extend '#raygun-errors',
  constructor: ->
    m.mount(this[0], RaygunErrors)
