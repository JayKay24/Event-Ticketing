import mongoose from "mongoose";

import { app } from "./app";

const port = 3000;

const start = async () => {
  if (!process.env.JWT_KEY) {
    throw new Error("JWT_KEY must be defined");
  }
  try {
    await mongoose.connect("mongodb://auth-mongo-srv:27017/auth", {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      useCreateIndex: true,
    });
    console.log("Connected to mongoDB");
  } catch (err) {
    console.error(err);
  }

  app.listen(port, () => {
    console.log(`App is listening on port ${port}!!!!!`);
  });
};

start();
