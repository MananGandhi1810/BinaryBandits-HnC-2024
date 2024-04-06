const express = require('express')
const { exec } = require('child_process')
const fs = require('fs')

const app = express()
app.use(express.json())

app.post('/runcode', (req, res) => {
  const { code, userId } = req.body
  const folder = `${userId}_${Date.now()}`
  fs.mkdirSync(`./${folder}`)
  fs.writeFileSync(`./${folder}/code.py`, code, err => {})
  const timeout_error = setTimeout(() => {
    res.send({ stdout: '', stderr: 'Timeout Error: Code execution time exceeded 10 seconds' })
  }, 10000)
  exec(`python3 ./${folder}/code.py`, (error, stdout, stderr) => {
    clearTimeout(timeout_error)
    console.log(`stdout: ${stdout}`)
    console.error(`stderr: ${stderr}`)
    res.send({ stdout, stderr })
  })
})

app.listen(3000, () => {
  console.log('Server running on port 3000')
})
