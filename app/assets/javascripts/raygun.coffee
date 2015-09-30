RaygunErrors =
  controller: ->
    { list: m.request({ method: 'GET', url: '/raygun/list' }) }

  view: (ctrl) ->
    console.log(ctrl.list())
    records = ctrl.list().activeErrors.records

    m '.results',
      records.map (record) -> [
        m '.title', record.message
        m 'pre', m('code', JSON.stringify(record))
      ]

DOM.extend '#raygun-errors',
  constructor: ->
    m.mount(this[0], RaygunErrors)
