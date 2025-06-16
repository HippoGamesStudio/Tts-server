const express = require('express');
const cors = require('cors');
const { exec } = require('child_process');
const fs = require('fs');

const app = express();
app.use(cors());
app.use(express.json());

app.post('/tts', async (req, res) => {
    const text = req.body.text;

    if (!text) return res.status(400).json({ error: "Text is required" });

    exec(`python3 tts.py "${text.replace(/"/g, "'")}"`, (error, stdout, stderr) => {
        if (error) {
            console.error(stderr);
            return res.status(500).json({ error: "TTS generation failed" });
        }
        res.sendFile(__dirname + '/output.wav');
    });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`TTS server running on port ${PORT}`);
});
