
import express, { Request, Response } from "express";
import userRouter from "./routers/userRouter";
import timeblockRouter from "./routers/timeblockRouter";
import projectRouter from "./routers/projectRouter";
import ventureRouter from "./routers/ventureRouter";
import { Prisma, PrismaClient } from "@prisma/client";
const cors  = require("cors");
export const prisma = new PrismaClient();

const app = express();

//! Global Midlleware
app.use(cors());
app.use(express.json());

//! Mount Routers
app.use("/api/users", userRouter);
app.use("/api/timeblocks", timeblockRouter);
app.use("/api/projects", projectRouter);
app.use("/api/ventures", ventureRouter);

const port = process.env.PORT || 5174

const server = app.listen(5174, () =>
  console.log(`
🚀 Server ready at: http://localhost:5174`)
);
