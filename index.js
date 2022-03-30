// import module
const express = require('express')
const fs = require('fs')
const path = require('path')
const GUID = require('guid')

// initialize api
const app =  express()

// initialis middleware
app.use(express.json())


// home route
app.get('/', (req, res) => {
    res.status(200).send(`<h1>Wellcome to my REST APIs</h1>`)
})

// get all clients
app.get('/api/clients', (req, res) => {
    fs.readFile(path.join(__dirname + '/clients.json'), (error, data) => {
        // check error
        if (error) {
            console.log('error :', error)
            return res.status(500).send('Internal Service Error.')
        }
        
        // if success -> data exist
        res.status(200).send(JSON.parse(data))
    })
})

// get single data => /api/clients/:id
app.get('/api/clients/:id', (req, res) => {
    const id = req.params.id
    console.log('id : ', id)
    fs.readFile(path.join(__dirname + '/clients.json'), (error, data) => {
        // check error
        if (error) {
            console.log('error :', error)
            return res.status(500).send('Internal Service Error.')
        }

        // if success -> data exist -> filter data by request :id
        const clients = JSON.parse(data)
        let client
        for (let i = 0; i < clients.length; i++) {
            if (clients[i].id === id) {
                client = clients[i]
                break
            }
        }

        // check result
        if (client === undefined) {
            return res.status(400).send(`Bad Request : client with id : ${id} doesn't found.`)

        }

        // send respond to client if result exist
        res.status(200).send(client)
    })
})

// post data => /api/clients
// 1. get req.body
// 2. create id => add to body, id => guid npm
// 3. read file => JSON.parse(data) => [{...}, {...}, ...]
// 4. push new data to result from JSON.parse
// 5. convert new data => JSON.stringfy(new data)
// 6. fs.writeFile
app.post('/api/clients', (req, res) => {
    const body = req.body

    // validation => check req.body is exists?
    if (!body.hasOwnProperty('name')) {
        return res.status(400).send(`Bad Request : body cannot be empty.`)
    }

    // PR :
    // buat sebuah fungsi untuk validasi -> 
    // 1. name -> max 13 chars, not include number
    // 2. email -> harus valid
    // 3. format phone number -> +62-xxx-xxxx-xxx
    // 4. iban -> valdiate digits -> dimulai dengan 2 huruf
    // 5. CVV -> 3 digits

    // create id => GUID
    const UID = GUID.raw().toUpperCase()
    console.log('new id : ', UID)

    body.id = UID

    // read data
    fs.readFile(path.join(__dirname + '/clients.json'), (error, data) => {
        // check error
        if (error) {
            console.log('error :', error)
            return res.status(500).send('Internal Service Error.')
        }

        // prase data
        let clients = JSON.parse(data)

        // add new data
        clients.push(body)
        
        // update data in file client.json
        fs.writeFile(
            path.join(__dirname + '/clients.json'), 
            JSON.stringify(clients, null, 2), 
            (error) => {
                if (error) {
                    console.log('error :', error)
                    return res.status(500).send('Internal Service Error.')
                }
    
                // send info to client if new data has been successfully created
                res.status(201).send(`user with id : ${UID} has been created.`)
            }
        )
    })
})

// PR : protocol patch

// delete data => api/clients/:id
// 1. get id
// 2. get data => fs.readFile => JSON.pares => search by id => data exist ? next : error
// 3. delete => split(index, 1)
// 4. fs.writeFile

// binding to our local port
const PORT = 5000
app.listen(PORT, () => console.log(`API run at port ${PORT}`))