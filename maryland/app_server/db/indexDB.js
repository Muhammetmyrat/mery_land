const { query } = require('express')
const { Pool } = require('pg')



const pool = new Pool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  database: process.env.DB_NAME,
  password: process.env.DB_USER_PASSWORD,
  port: process.env.DB_PORT
})


module.exports = {
    async query(q_text,params){
        const res = await pool.query(q_text,params)
        return res
    },
    pool
}