export default () => { 
    const element = document.createElement('h2')
    element.textContent = 'Hello webpack'
    element.addEventListener('click', () => { 
        alert('hello webpack')
    })
    return element
}