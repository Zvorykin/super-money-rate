export default async (app, cb, showLoading = true) => {
  if ((app.loading === false) && showLoading) app.loading = true

  let res
  try {
    res = await cb()

    if (app.loading) app.loading = false
    return res && res.data
  } catch (err) {
    if (app.loading) app.loading = false

    const { statusText, status, body, data } = err.response || {}
    const { exception } = data
    const message = `Error ${ status || '' }: ${ statusText || '' } ${ body || '' }
      ${ exception || data || '' }`

    app.$q.notify({
      message,
      position: 'center',
      timeout: 0,
      color: 'red',
      multiLine: true,
      icon: 'ion-alert',
      actions: [ { icon: 'ion-close', color: 'white' } ]
    })

    throw err
  }
}
