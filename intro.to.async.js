// function isOddNumber (numb) {
//     return new Promise((resolve, reject) => {
//         if (numb % 2 === 0) {
//             reject(false)
//         } else {
//             resolve(true)
//         }
//     })
// }

// isOddNumber(4)
// .then(res => console.log(res))
// .catch(error => console.log(error))

// ECMA SCRIPT 5 : ES5
// async await

async function isEvenNumber (numb) {
    if (numb % 2 === 0) {
        return true
    } else {
        throw false
    }
}

async function main () {
    let myName = "alee"
    console.log(myName)
    
    let hello = "hello world"
    console.log(hello)
    
    try {
        const result = await isEvenNumber(8)
        console.log(result)
    } catch (err) {
        console.log(err)
    }

    console.log("fullstack")
}

main()