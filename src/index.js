// import module
const express = require('express')

// initialize api
const app =  express()

// initialis middleware
app.use(express.json())


// home route
app.get('/', (req, res) => {
    res.status(200).send(`<h1>Wellcome to my REST APIs</h1>`)
})

// implement routes
const routes = require('./routes')
app.use('/api', routes.clientRoutes)


// binding to our local port
const PORT = 5000
app.listen(PORT, () => console.log(`API run at port ${PORT}`))