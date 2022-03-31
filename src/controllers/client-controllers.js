const fs = require('fs')
const GUID = require('guid')
const path = require('path')
const { postValidation } = require('../helpers/client-validation')
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
    console.log('body : ', body)
    
    // data validation
    const error = postValidation(body)
    if (error) {
        return res.status(200).send(error)
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

        // validate duplicate data
        // uniques => name, email, phone, iban, cvv
        let isUnique = true
        for (let i = 0; i < clients.length; i++) {
            if (clients[i].name === body.name) {
                isUnique = false
                break
            }
            if (clients[i].email === body.email) {
                isUnique = false
                break
            }
            if (clients[i].phone === body.phone) {
                isUnique = false
                break
            }
            if (clients[i].iban === body.body) {
                isUnique = false
                break
            }
            if (clients[i].cvv === body.cvv) {
                isUnique = false
                break
            }
        }

        if(!isUnique) {
            return res.status(400).send('Bad Request : data cannot be duplicate.')
        }

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

const patchClient = (req, res) => {
    // get id
    // check data with id ? exist ?
    // before do update -> do validation data
    // write file
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