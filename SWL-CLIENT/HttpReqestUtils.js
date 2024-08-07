function sendRequestJson(requsetMethod, url, callback) {
    const request = new XMLHttpRequest()

    request.open(requsetMethod, url, true)
    request.responseType = "json"
    request.setRequestHeader("method", "post")

    request.onreadystatechange = () => {
        if (request.readyState == request.DONE && request.status == 200) {
            callback(JSON.parse(request.responseText))
        }

        /*else {
        console.log(`Error: ${request.status}`)
        }*/
    }

    request.send()
}


function sendRequestHTML(requsetMethod, url, callback) {
    const request = new XMLHttpRequest()

    request.open(requsetMethod, url, true)
    request.responseType = "json"
    request.setRequestHeader("method", "post")

    request.onreadystatechange = () => {
        if (request.readyState == request.DONE && request.status == 200) {
            callback((request.responseText))
        }

        /*else {
        console.log(`Error: ${request.status}`)
        }*/
    }

    request.send()
}
