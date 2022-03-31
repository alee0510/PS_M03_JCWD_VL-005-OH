const fs = require('fs')
const GUID = require('guid')
const path = require('path')
const __dirclients = './__database__'

const getClients = (req, res) => {
    fs.readFile(path.join(__dirclients + '/clients.json'), (error, data) => {
        // check error
        if (error) {
            console.log('error :', error)
            return res.status(500).send('Internal Service Error.')
        }
        
        // if success -> data exist
        res.status(200).send(JSON.parse(data))
    })
}

const getClientById = (req, res) => {
    const id = req.params.id
    console.log('id : ', id)
    fs.readFile(path.join(__dirclients + '/clients.json'), (error, data) => {
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
}

const postClient = (req, res) => {
    const body = req.body

    // validation => check req.body is exists?
    if (body === undefined ) {
        return res.status(400).send(`Bad Request : body cannot be empty.`)
    }

    // PR :
    // buat sebuah fungsi untuk validasi -> 
    // 1. name -> max 13 chars, not include number
    if (body.name.length > 13 || !body.name.length) {
        return res.status(400).send(`Bad Request : client name cannot be more than 13 chars.`)
    }

    // 2. email -> harus valid
    const EmailRegex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    if (!EmailRegex.test(body.email) ) {
        return res.status(400).send(`Bad Request : email doesn't valid.`)
    }
    // 3. format phone number -> +62-xxx-xxxx-xxx
    const PhoneRegex =  /^[+]*[(]{0,1}[0-9]{1,3}[)]{0,1}[-\s\./0-9]*$/g
    if (!PhoneRegex.test(body.phone)) {
        return res.status(400).send(`Bad Request : phone number doesn't valid.`)
    }
    // 4. iban -> valdiate digits -> dimulai dengan 2 huruf
    
    // 5. CVV -> 3 digits
    if (String(body.cvv).length > 3) {
        return res.status(400).send(`Bad Request : CVV number doesn't valid.`)
    }

    // create id => GUID
    const UID = GUID.raw().toUpperCase()
    console.log('new id : ', UID)

    body.id = UID

    // read data
    fs.readFile(path.join(__dirclients + '/clients.json'), (error, data) => {
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
            path.join(__dirclients + '/clients.json'), 
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
}

const deleteClient = (req, res) => {
    const id = req.params.id

    // validate id
    const valid = GUID.isGuid(id.toLowerCase())
    if (!valid) {
        return res.status(400).send(`Bad Request : ID doesn't valid.`)
    }

    // read file 
    fs.readFile(path.join(__dirclients + '/clients.json'), (error, data) => {
        // check error
        if (error) {
            console.log('error :', error)
            return res.status(500).send('Internal Service Error.')
        }

        // parse data
        let clients = JSON.parse(data)

        // check client's data by id
        let index
        for (let i = 0; i < clients.length - 1; i++) {
            if (clients[i].id === id) {
                index = i
                break
            }
        }

        // if client doesn't exist
        if (index === undefined) {
            return res.status(404).send(`client with id : ${id} doesn't found.`)
        }

        // if exists => do delete
        clients.splice(index, 1)
        
        // update file clients.json
        fs.writeFile(
            path.join(__dirclients + '/clients.json'),
            JSON.stringify(clients, null, 2),
            (error) => {
                if (error) {
                    console.log('error : ', error)
                    return res.status(500).send('Internal Service Error.')
                }
                
                // if success => send respond to client side
                res.status(200).send(`client with id : ${id} has been deleted.`)
            }
        )
    })
}

module.exports = { 
    getClients,
    getClientById,
    postClient,
    deleteClient
}