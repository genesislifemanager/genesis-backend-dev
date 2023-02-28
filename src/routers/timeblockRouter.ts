import express from "express";
import { getAllTimeBlocks,createTimeblock } from "../controllers/timeblockController";
    
const timeblockRouter = express.Router();


timeblockRouter.route('/').get(getAllTimeBlocks).post(createTimeblock);

export default timeblockRouter;