import axios from 'axios'

const API_URL = 'http://10.192.1.52:3000/api'

export const request  = async (url, method = 'get', data = null) => {
	  const res = await axios[method](`${API_URL}/${url}`, data)
	  return res.data
}