//import from packages

// const e = require("express");
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
//import from othr files

const authRouter = require("./routes/auth");

//Init
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://arshad:arshad123@cluster0.kvwsgom.mongodb.net/?retryWrites=true&w=majority";
//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//connection
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
