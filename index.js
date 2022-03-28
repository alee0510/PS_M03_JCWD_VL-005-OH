// import module
const express = require('express')

// initialize api
const app =  express()

// database
const products = [
    { id : 1, name : 'Samsung Galaxy S22', price : 220000, brand : 'Samsung' },
    { id : 2, name : 'Samsung Galaxy S21', price : 210000, brand : 'Samsung' },
    { id : 3, name : 'iPhone 13 Pro', price : 250000, brand : 'Apple' }
]

// home route
app.get('/', (request, respond) => {
    respond.status(200).send(`<h1>Wellcome to my REST APIs</h1>`)
})

// CRUD (CREATE, READ, UPDATE, DELETE)
// 1. READ
app.get('/products', (req, res) => {
    res.status(200).send(products)
})

// 1.1 READ single data => GET /products/:id => {...}
// 2. CREATE DATA => POST /products
// 3. UPDATE => PUT/PATCH /products/:id
// 4. DELETE => DELETE /products/:id


// binding to our local port
const PORT = 5000
app.listen(PORT, () => console.log(`API run at port ${PORT}`))