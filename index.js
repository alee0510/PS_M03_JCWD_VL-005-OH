// import module
const express = require('express')

// initialize api
const app =  express()

// initialis middleware
app.use(express.json())

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
app.get('/products/:id', (req, res) => {
    const id = Number(req.params.id)
    console.log('id' , id)

    const data = products.filter((product) => product.id === id)

    // vaidation
    if (!data.length) {
        res.status(404).send(`product with id : ${id} doesn't found.`)
        return
    }

    res.status(200).send(data[0])
})
// 2. CREATE DATA => POST /products
app.post('/products', (req, res) => {
    let body = { ...req.body }
    
    body.id = products.length + 1
    console.log(body)

    // add new data products
    products.push(body)

    res.status(201).send(products)
})
// 3. UPDATE => PUT/PATCH /products/:id
// 4. DELETE => DELETE /products/:id
app.delete('/products/:id', (req, res) => {
    const id = Number(req.params.id)
    console.log(id)

    // check data
    let index
    for (let i = 0; i < products.length - 1; i++) {
        if (id === products[i].id) {
            index = i
        }   
    }

    console.log(index)

    if (index === undefined) {
        res.status(404).send(`product with id : ${id} doesn't found.`)
        return
    }

    // delete
    products.splice(index, 1)

    // send respond
    res.status(200).send(`product with id : ${id} has been deleted.`)

})


// binding to our local port
const PORT = 5000
app.listen(PORT, () => console.log(`API run at port ${PORT}`))