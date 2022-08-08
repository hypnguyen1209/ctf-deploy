const app = require('express')()

app.get('*', (req, res) => {
    res.json({
        status: true
    })
})

app.listen(process.env.PORT)