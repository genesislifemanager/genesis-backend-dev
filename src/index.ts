
import express, { Request, Response } from "express";
import userRouter from "./routers/userRouter";
import { Prisma, PrismaClient } from "@prisma/client";
export const prisma = new PrismaClient();


const app = express();

//! Global Midlleware
app.use(express.json());

//! Mount Routers
app.use("/api/v1/users", userRouter);


const server = app.listen(3000, () =>
  console.log(`
🚀 Server ready at: http://localhost:3000`)
);
