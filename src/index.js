// import modules
const express = require('express')
const dotenv = require('dotenv')
dotenv.config()

// intialize
const app = express()

// configure middleware
app.use(express.json())

// test database connection
const connection = require('./config')
connection.connect((error) => {
    if (error) {
        console.log('error : ', error)
    }

    console.log(`database connection established at id : ${connection.threadId}.`)
})

// home route
app.get('/', (req, res) => res.status(200).send('<h1>Wellcome to My REST-APIs</h1>'))

// setup router
const routers = require('./routes')
app.use('/api', routers.student_router)

// binding
const PORT = process.env.PORT || 5000
app.listen(PORT, () => console.log(`API is connected at port : ${PORT}.`))