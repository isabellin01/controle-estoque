import dotenv from "dotenv";

import express from "express";
import cors from "cors";
import { pool } from "./db.js";

dotenv.config();

const app = express();
const PORT = process.env.DB_PORT || 3306;

app.use(cors());
app.use(express.json());

app.listen(PORT, () => {
    console.log(`Server is running on ${PORT}`)
})

app.get('/', (req, res) => {
    res.send('Hello from Node API updated')
})